//
//  NotesView.swift
//  test
//
//  Created by shafia on 05/08/2025.
//

import SwiftUI

struct NotesView: View {
    @AppStorage("notes") private var notes: String = ""

    var body: some View {
        VStack {
            TextEditor(text: $notes)
                .padding()
                .border(Color.gray)
        }
        .padding()
        .navigationTitle("Notes")
    }
}

#Preview {
    NotesView()
}
