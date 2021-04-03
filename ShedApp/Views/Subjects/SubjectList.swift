//
//  SubjectList.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct SubjectList: View {
    @ObservedObject var graphQLData = GraphQLData()
    @State var currentUser = [CurrentUserQuery.Data.Me]()
    @State var addSubjectShowing = false
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(currentUser, id: \.id) { user in
                    if let subjects = user.mySubjects?.compactMap { $0 } {
                        ForEach(subjects, id: \.subjectName) { subject in
                            SubjectRow(subject: subject)
                        }
                    }
                }
            }
            .navigationTitle("My Subjects")
            .toolbar {
                Button(action: { addSubjectShowing.toggle() }) {
                    Image(systemName: "plus.circle")
                        .accessibilityLabel("Add subject")
                }
            }
            .sheet(isPresented: $addSubjectShowing) {
                AddSubject(isPresented: $addSubjectShowing)
                    .onDisappear {
                        Network.shared.apollo.fetch(query: CurrentUserQuery(), cachePolicy: .fetchIgnoringCacheCompletely)  { result in
                            switch result {
                            case .success(let result):
                                if let userConnection = result.data?.me {
                                    currentUser = [userConnection].compactMap { $0 }
                                }
                            case .failure(let error):
                                print("GraphQL Error: \(error)")
                            }
                        }
                    }
            
        }
        .onAppear {
            Network.shared.apollo.fetch(query: CurrentUserQuery(), cachePolicy: .fetchIgnoringCacheCompletely)  { result in
                switch result {
                case .success(let result):
                    if let userConnection = result.data?.me {
                        currentUser = [userConnection].compactMap { $0 }
                    }
                case .failure(let error):
                    print("GraphQL Error: \(error)")
                }
            }
        }
    }
}

}
