//
//  History.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct SessionList: View {
    @EnvironmentObject var graphQLData: GraphQLData
    @State var currentUser: CurrentUserQuery.Data.Me?
       
    var dateArr: [Date] = []
    var body: some View {
        NavigationView {
            ScrollView {
                if let sessions = currentUser?.sessions?.sorted { inDateFormatter.date(from: $0!.date)! > inDateFormatter.date(from: $1!.date)! }.compactMap { $0 } {
                    ForEach(sessions, id: \.id) { session in
                        SessionRow(session: session)
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
                        currentUser = userConnection
                    }
                case .failure(let error):
                    print("GraphQL Error: \(error)")
                }
            }
        }
    }
}
