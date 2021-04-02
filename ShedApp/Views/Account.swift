//
//  Account.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct Account: View {
    @EnvironmentObject var graphQLData: GraphQLData
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(graphQLData.currentUser, id: \.id) { user in
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
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
            .environmentObject(GraphQLData())
    }
}
