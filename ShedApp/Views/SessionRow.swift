//
//  SessionRow.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/30/21.
//

import SwiftUI

let inDateFormatter = ISO8601DateFormatter()
let outDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        df.locale = Locale(identifier: "en_US_POSIX")
        return df
}()

func dateParser(dateString: String) -> String {
    print(dateString)
    let date: Date? = inDateFormatter.date(from: dateString)
    let formattedString: String = outDateFormatter.string(from: date ?? Date())
    return formattedString
}


struct SessionRow: View {
    var session: CurrentUserQuery.Data.Me.Session
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(DateParser(dateString:session.date))
                    .font(.title)
                    .padding(.bottom, 10)
                Text("Length: \(TimeParser(seconds: session.totalLength!))")
                Text("Subjects practiced:")
                if let subjects = session.individualSubjects?.compactMap { $0 } {
                    ForEach(subjects, id: \.name) { subject in
                        Text(subject.name)
                            .bold()
                        Text(TimeParser(seconds: subject.length))
                    }
                }
            }
            .padding()
            Spacer()
            Divider()
        }
        .padding(.vertical, 4)
    }
}


