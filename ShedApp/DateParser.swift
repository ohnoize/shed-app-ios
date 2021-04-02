//
//  DateParser.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 4/1/21.
//

import Foundation

let inDateFormatter: DateFormatter = {
    let dtf = DateFormatter()
    dtf.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return dtf
}()

let altDateFormatter: DateFormatter = {
    let dtrf = DateFormatter()
    dtrf.dateFormat = "E MMM dd yyyy HH:mm:ss zzzZ (zzzz)"
    return dtrf
}()

let outDateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeStyle = .none
    df.dateStyle = .short
    return df
}()

func DateParser(dateString: String) -> String {

    let formattedString: String
    guard let date = inDateFormatter.date(from: dateString) else {
        return dateString;
    }
    formattedString = outDateFormatter.string(from: date)
    return formattedString
}
