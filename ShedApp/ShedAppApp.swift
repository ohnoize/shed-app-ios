//
//  ShedAppApp.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

@main
struct ShedAppApp: App {
    @StateObject private var graphQLData = GraphQLData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(graphQLData)
        }
    }
}
