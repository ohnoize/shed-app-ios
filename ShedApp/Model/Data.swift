//
//  ModelData.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import Foundation
import Combine
import Apollo
import KeychainSwift

final class GraphQLData: ObservableObject {
    @Published var subjects = [GetSubjectsQuery.Data.AllSubject]()
    @Published var sessions = [GetSessionsQuery.Data.AllSession]()
    @Published var currentUser = [CurrentUserQuery.Data.Me]()
    
    
    init() {
        Network.shared.apollo.perform(mutation: LoginMutation(username: "testUser", password: "testPassword")) { result in
            switch result {
            case .success(let result):
                print(result)
                if let token = result.data?.login?.token {
                    let keychain = KeychainSwift()
                    keychain.set(token, forKey: "authToken")
                }
            case .failure(let error):
                print("Error from server: \(error)")
            }
        }
        Network.shared.apollo.fetch(query: GetSubjectsQuery())  { result in
            switch result {
            case .success(let result):
                if let subjectsConnection = result.data?.allSubjects {
                    self.subjects = subjectsConnection.compactMap { $0 }
                }
            case .failure(let error):
                print("GraphQL error: \(error)")
            }
        }
        Network.shared.apollo.fetch(query: GetSessionsQuery())  { result in
            switch result {
            case .success(let result):
                if let sessionsConnection = result.data?.allSessions {
                    self.sessions = sessionsConnection.compactMap { $0 }
                }
            case .failure(let error):
                print("GraphQL Error: \(error)")
            }   
        }
        Network.shared.apollo.fetch(query: CurrentUserQuery())  { result in
            switch result {
            case .success(let result):
                if let userConnection = result.data?.me {
                    self.currentUser = [userConnection].compactMap { $0 }
                }
            case .failure(let error):
                print("GraphQL Error: \(error)")
            }
        }
    }
}
