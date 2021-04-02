//
//  SubjectList.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct SubjectList: View {
    @ObservedObject var graphQLData = GraphQLData()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(graphQLData.currentUser, id: \.id) { user in
                    if let subjects = user.mySubjects?.compactMap { $0 } {
                        ForEach(subjects, id: \.subjectName) { subject in
                            SubjectRow(subject: subject)
                        }
                    }
                }
            }
            .navigationTitle("My Subjects")
            .toolbar {
                Button(action: { print("ADD SUBJECT") }) {
                    Image(systemName: "plus.circle")
                        .accessibilityLabel("Add subject")
                }
            }
        }
    }
}

struct SubjectList_Previews: PreviewProvider {
    static var previews: some View {
        SubjectList()
            .environmentObject(ModelData())
    }
}
