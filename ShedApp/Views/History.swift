//
//  History.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct History: View {
    @ObservedObject var graphQLData = GraphQLData()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(graphQLData.currentUser, id: \.id) { user in
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
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
