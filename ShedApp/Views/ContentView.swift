//
//  ContentView.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .timer
    @ObservedObject var stopWatchManager = StopWatchManager()
    @EnvironmentObject var modelData: ModelData
    
    enum Tab {
        case timer
        case account
        case subjects
        case goals
        case history
    }
        
    var body: some View {
        TabView(selection: $selection) {
            MainTimer()
                .tabItem {
                    Label("Timer", systemImage: "house")
                }
                .tag(Tab.timer)
            Goals()
                .tabItem {
                    Label("Goals", systemImage: "rosette")
                }
                .tag(Tab.goals)
            SubjectList()
                .tabItem {
                    Label("My Subjects", systemImage: "folder.fill")
                }
                .tag(Tab.subjects)
            History()
                .tabItem {
                    Label("My Sessions", systemImage: "book.fill")
                }
                .tag(Tab.history)
            Account()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
                .tag(Tab.account)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
