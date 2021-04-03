//
//  AddSubject.swift
//  ShedApp
//
//  Created by Olli Hirvonen on 4/2/21.
//

import SwiftUI

struct AddSubject: View {
    @Binding var isPresented: Bool
    @State var name: String = ""
    @State var description: String = ""
    func handleAddSubject() {
        print("Name: \(name), description: \(description)")
        isPresented = false
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Add New Subject")
                .font(.title)
                .padding()
            List {
                HStack {
                    Text("Name")
                        .bold()
                    Divider()
                    TextField("e.g. Monk tunes", text: $name)
                }
                .padding()
                HStack {
                    Text("Description")
                        .bold()
                    Divider()
                    TextField("e.g. Compositions by Thelonious Monk", text: $description)
                }
                .padding()
                
                Button("Add Subject") {
                    handleAddSubject()
                }
                .padding()

            }
        }
    }
}
