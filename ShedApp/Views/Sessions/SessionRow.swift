//
//  SessionRow.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 3/30/21.
//

import SwiftUI




struct SessionRow: View {
    var session: CurrentUserQuery.Data.Me.Session
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(DateParser(dateString: session.date))
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


