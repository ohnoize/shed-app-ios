//
//  AddNewGoal.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 4/2/21.
//

import SwiftUI

struct AddNewGoal: View {
    @EnvironmentObject var graphQLData: GraphQLData
    @Binding var isPresented: Bool
    @State var description: String = ""
    @State var subject: String = ""
    @State var date: Date = Date()
    @State var hours: Int = 0
    
    
    func handleAddGoal() {
        print("ADD GOALLL")
        let userID = graphQLData.currentUser.compactMap({ $0.id })
        let seconds = hours * 3600
        let dateFormatter: ISO8601DateFormatter = {
            let df = ISO8601DateFormatter()
            df.formatOptions = [.withFullDate, .withFullTime, .withFractionalSeconds]
            return df
        }()
        let deadline: String = dateFormatter.string(from: date)
        let addGoalInput = goalInput(description: description, subject: subject, targetTime: seconds, deadline: deadline)
        Network.shared.apollo.perform(mutation: AddGoalMutation(id: userID[0], goal: addGoalInput))
        description = ""
        subject = ""
        hours = 0
        isPresented = false
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Add New Goal")
                .font(.title)
                .padding()
            List {
                HStack {
                    Text("Description")
                        .bold()
                    Divider()
                    TextField("e.g. Practice chords for 10 hours this week", text: $description)
                }
                .padding()
                HStack {
                    Picker("Pick a subject", selection: $subject) {
                        ForEach(graphQLData.subjects.compactMap({ $0.name }), id: \.self) { subject in
                            Text(subject).tag(subject)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    Text(subject)
                        .padding()
                }
                .padding()
                HStack {
                    Text("Amount of hours")
                        .bold()
                    Divider()
                    Picker("Hours", selection: $hours) {
                        ForEach(1..<1000) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                }
                .padding()
                HStack {
                    DatePicker("Deadline", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                }
                .padding()
                Button("Add Goal") {
                    handleAddGoal()
                }
                .padding()

            }
        }
    }
}

