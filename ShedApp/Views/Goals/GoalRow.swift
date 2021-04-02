//
//  GoalRow.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 4/1/21.
//

import SwiftUI

struct GoalRow: View {
    var goal: CurrentUserQuery.Data.Me.Goal
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(goal.description)
                    .font(.title)
                    .padding(.bottom, 10)
                Text(goal.subject)
                Text("Time left: \(TimeParser(seconds: (goal.targetTime - goal.elapsedTime)))")
                Text("Deadline: \(DateParser(dateString: goal.deadline!))")
            }
            .padding()
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
