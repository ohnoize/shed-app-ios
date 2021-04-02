//
//  Goals.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct Goals: View {
    @EnvironmentObject var graphQLData: GraphQLData
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(graphQLData.currentUser, id: \.id) { user in
                    if let goals = user.goals?.compactMap { $0 } {
                        ForEach(goals, id: \.id) { goal in
                            GoalRow(goal: goal)
                        }
                    }
                }
            }
            .navigationTitle("My Goals")
            .toolbar {
                Button(action: { print("ADD GOAL") }) {
                    Image(systemName: "plus.circle")
                        .accessibilityLabel("Add goal")
                }
            }
        }
    }
}


struct Goals_Previews: PreviewProvider {
    static var previews: some View {
        Goals()
            .environmentObject(GraphQLData())
    }
}
