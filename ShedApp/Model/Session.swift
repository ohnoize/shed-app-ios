//
//  Session.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/30/21.
//

import Foundation

struct Session: Hashable, Codable, Identifiable {
    
    var id: String
    var date: String
    var totalLength: Int
    var notes: String
    var individualSubjects: [SessionSubject]
    
    struct SessionSubject: Identifiable, Hashable, Codable {
        var id: String {self.name}
        
        var name: String
        var length: Int
    }
    
}

