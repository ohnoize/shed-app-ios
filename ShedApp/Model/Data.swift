//
//  ModelData.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import Foundation
import Combine
import Apollo

final class GraphQLData: ObservableObject {
    @Published var subjects = [GetSubjectsQuery.Data.AllSubject]()
    @Published var sessions = [GetSessionsQuery.Data.AllSession]()
    @Published var currentUser = [CurrentUserQuery.Data.Me]()
    
    init() {
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


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
