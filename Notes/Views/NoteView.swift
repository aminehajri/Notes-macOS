//
//  NoteView.swift
//  Notes
//
//  Created by Amine Hajri on 27.06.24.
//

import SwiftUI

struct NoteView: View {
    
    typealias NoteAdded = ((String, Date?) -> Void)?
    
    var onNoteAdded: NoteAdded
    
    init(onNoteAdded: NoteAdded = nil) {
        self.onNoteAdded = onNoteAdded
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            List(1...10, id: \.self) { index in
                Text("Item \(index)")
            }
            
            AddNewNoteView { title, dueDate in
                onNoteAdded?(title, dueDate)
            }
        }
    }
}

#Preview {
    NoteView()
}
