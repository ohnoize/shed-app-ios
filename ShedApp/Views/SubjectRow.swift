//
//  SubjectRow.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 4/1/21.
//

import SwiftUI

struct SubjectRow: View {
    var subject: CurrentUserQuery.Data.Me.MySubject
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(subject.subjectName)
                    .font(.title)
                    .padding(.bottom, 10)
                Text("Time practiced: \(TimeParser(seconds: subject.timePracticed))")
                    .padding(.bottom, 10)
                if let notes = subject.subjectNotes?.compactMap { $0 } {
                    if notes.count > 0 {
                        Text("Notes:")
                    }
                    ForEach(notes, id: \.notes) { note in
                        Text("\(DateParser(dateString: note.date)) \(note.notes)")
                    }
                }
            }
            .padding()
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

