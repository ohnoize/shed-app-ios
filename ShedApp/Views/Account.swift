//
//  Account.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct Account: View {
    @EnvironmentObject var graphQLData: GraphQLData
    @State var currentUser = [CurrentUserQuery.Data.Me]()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(currentUser, id: \.id) { user in
                    HStack {
                        VStack(alignment:.leading) {
                            Text(user.username)
                                .font(.title)
                                .padding(.bottom, 10)
                            Text(user.instrument!)
                            Text("Joined: \(DateParser(dateString: user.joined))")
                            Text("Total time practiced: \(TimeParser(seconds: user.timePracticed))")
                        }
                        .padding()
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("My Account")
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

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
            .environmentObject(GraphQLData())
    }
}
