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
    var notes: [NoteViewModel]
    
    init(onNoteAdded: NoteAdded = nil, notes: [NoteViewModel]) {
        self.onNoteAdded = onNoteAdded
        self.notes = notes
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List {
                
                ForEach(notes, id: \.noteId) { note in
                    Text(note.title)
//                    Divider()
                }
                
                AddNewNoteView { title, dueDate in
                    onNoteAdded?(title, dueDate)
                }
            }
        }
    }
}

#Preview {
    NoteView(notes: [])
}
