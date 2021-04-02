//
//  TimeParser.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/29/21.
//

import Foundation

func TimeParser(seconds: Int) -> String {

    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad

    let formattedString = formatter.string(from: TimeInterval(seconds))!
    return formattedString
}
