//
//  Subject.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import Foundation

struct Subject: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var timePracticed: Int
}
