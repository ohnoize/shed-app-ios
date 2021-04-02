//
//  Goals.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct Goals: View {
    @EnvironmentObject var graphQLData: GraphQLData
    @State var currentUser = [CurrentUserQuery.Data.Me]()
    @State private var addGoalShowing = false
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(currentUser, id: \.id) { user in
                    if let goals = user.goals?.compactMap { $0 } {
                        ForEach(goals, id: \.id) { goal in
                            GoalRow(goal: goal)
                        }
                    }
                }
            }
            .navigationTitle("My Goals")
            .toolbar {
                Button(action: { addGoalShowing.toggle() }) {
                    Image(systemName: "plus.circle")
                        .accessibilityLabel("Add goal")
                }
            }
            .sheet(isPresented: $addGoalShowing) {
                AddNewGoal(isPresented: $addGoalShowing)
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


struct Goals_Previews: PreviewProvider {
    static var previews: some View {
        Goals()
            .environmentObject(GraphQLData())
    }
}
