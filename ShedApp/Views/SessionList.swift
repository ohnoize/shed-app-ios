//
//  History.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct SessionList: View {
    @EnvironmentObject var graphQLData: GraphQLData
    @State var currentUser = [CurrentUserQuery.Data.Me]()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(currentUser, id: \.id) { user in
                    if let sessions = user.sessions?.compactMap { $0 } {
                        ForEach(sessions, id: \.id) { session in
                            SessionRow(session: session)
                        }
                    }
                }
            }
            .frame(minWidth: 300)
            .navigationTitle("My Sessions")
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
