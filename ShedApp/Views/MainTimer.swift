//
//  MainTimer.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct MainTimer: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    @EnvironmentObject var graphQLData: GraphQLData
    @State var currentUser = [CurrentUserQuery.Data.Me]()
    @State var subjects = [CurrentUserQuery.Data.Me.MySubject?]()
    @ObservedObject var notificationManager = LocalNotificationManager()
    
    struct SessionSubject: Identifiable, Hashable {
        var id: String {self.name}
        
        var name: String = ""
        var length: Int = 0
    }
    
    
    struct PracticeTime {
        var totalTime: Int = 0
        var notes: String
        var userID: String
        var individualSubjects: [SessionSubject]
    }
    
    @State private var practiceTime = PracticeTime(
        notes: "",
        userID: "olli",
        individualSubjects: []
    )
    
    @State private var subjectData = SessionSubject(
        name: "", length: 0
    )
    
    @State var subject: String = ""
    
    func handleStart() {
        if subject == "" {
            showingError = true
            return
        }
        self.stopWatchManager.start()
    }
    
    func handleStop(seconds: Int) {
        self.stopWatchManager.stop()
        practiceTime.totalTime += seconds
        let userID = currentUser.compactMap({ $0.id })
        print(userID)
        if let index = practiceTime.individualSubjects.map({$0.name}).firstIndex(of: subject) {
            practiceTime.individualSubjects[index].length += seconds
        } else {
            practiceTime.individualSubjects.append(SessionSubject(name: subject, length: seconds))
        }
        for user in currentUser {
            if let goals = user.goals?.compactMap({ $0 }) {
                if let i = goals.compactMap({ $0.subject }).firstIndex(of: subject) {
                    editGoal(seconds: seconds, userID: userID[0], goalID: goals[i].id)
                }
            }
        }
    }
    
    func editGoal(seconds: Int, userID: String, goalID: String) {
        Network.shared.apollo.perform(
            mutation: EditGoalMutation(
                userID: userID,
                goalID: goalID,
                time: seconds
            )
        )
    }
    
    @State private var showingConfirm = false
    @State private var showingError = false
    
    
    
    func handleFinish() {
        print("SESSION OVER")
        print(practiceTime)
        var subjectsInput = [sessionSubjectInput]()
        for subject in practiceTime.individualSubjects {
            let input = sessionSubjectInput(name: subject.name, length: subject.length)
            subjectsInput.append(input)
        }
        let userID = graphQLData.currentUser.compactMap({ $0.id })

        Network.shared.apollo.perform(
            mutation: AddSessionMutation(
                totalLength: practiceTime.totalTime,
                individualSubjects: subjectsInput,
                notes: practiceTime.notes,
                userID: userID[0]
            )
        )
        
        practiceTime.individualSubjects = []
        practiceTime.notes = ""
        practiceTime.totalTime = 0
        subject = ""
        self.notificationManager.sendNotification(title: "Session saved", subtitle: nil, body: "Your practice session has been saved!", launchIn: 5)
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Shed App")
                        .font(.largeTitle)
                        .padding(.top, 100)
                        .padding(.bottom, 100)
                    
                    if stopWatchManager.mode != .running {
                        if subject == "" {
                            Picker("Pick a subject", selection: $subject) {
                                ForEach(subjects.compactMap({ $0?.subjectName }), id: \.self) { subject in
                                    Text(subject).tag(subject)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                        } else {
                            Picker("Change", selection: $subject) {
                                ForEach(subjects.compactMap({ $0?.subjectName }), id: \.self) { subject in
                                    Text(subject).tag(subject)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            
                            Text(subject)
                                .font(.title2)
                                .padding()
                        }
                    }
                    HStack {
                        if stopWatchManager.mode == .stopped && subject != "" {
                            Button("Start") {
                                handleStart()
                            }
                            .alert(isPresented: $showingError) {
                                Alert(
                                    title: Text("Pick a subject first"),
                                    dismissButton: .default(Text("Ok"))
                                )
                            }
                            .padding()
                        }
                        if stopWatchManager.mode == .running {
                            VStack(alignment: .center) {
                                Text("Now practicing \(subject)")
                                Text(TimeParser(seconds: stopWatchManager.secondsElapsed))
                                    .font(.subheadline)
                                    .padding()
                                
                                Button("Stop") {
                                    handleStop(seconds: stopWatchManager.secondsElapsed)
                                }
                                .padding()
                            }
                        }
                        if stopWatchManager.mode == .stopped && practiceTime.totalTime > 0 {
                            Button("Finish") {
                                showingConfirm = true
                            }
                            .alert(isPresented: $showingConfirm) {
                                Alert(
                                    title: Text("Are you sure you want to finish the session?"),
                                    primaryButton: .default(Text("Finish")) {
                                        handleFinish()
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            .padding()
                        }
                        
                    }
                    
                    if practiceTime.individualSubjects.count > 0 {
                        ForEach(practiceTime.individualSubjects, id: \.self) { subject in
                            Text("\(subject.name) \(String(TimeParser(seconds: subject.length)))")
                        }
                        Text("Total time practiced: \(String(TimeParser(seconds: practiceTime.totalTime)))")
                            .padding(.top, 10)
                    }
                }
                .onAppear {
                    Network.shared.apollo.fetch(query: CurrentUserQuery(), cachePolicy: .fetchIgnoringCacheCompletely)  { result in
                        switch result {
                        case .success(let result):
                            if let userConnection = result.data?.me {
                                print(userConnection)
                                currentUser = [userConnection].compactMap { $0 }
                            }
                            if let subjectsConnection = result.data?.me?.mySubjects {
                                subjects = subjectsConnection
                            }
                        case .failure(let error):
                            print("GraphQL Error: \(error)")
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MainTimer_Previews: PreviewProvider {
    static var previews: some View {
        MainTimer()
            .environmentObject(GraphQLData())
    }
}
