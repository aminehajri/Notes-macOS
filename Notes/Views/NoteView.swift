//
//  NoteView.swift
//  Notes
//
//  Created by Amine Hajri on 27.06.24.
//

import SwiftUI

struct NoteView: View {
    
    typealias NoteAdded = ((String, Date?) -> Void)?
    typealias NoteDeleted = ((NoteViewModel) -> Void)?
    
    var onNoteAdded: NoteAdded
    var onNoteDeleted: NoteDeleted
    var notes: [NoteViewModel]
    
    init(onNoteAdded: NoteAdded = nil, onNoteDeleted: NoteDeleted = nil, notes: [NoteViewModel]) {
        self.onNoteAdded = onNoteAdded
        self.onNoteDeleted = onNoteDeleted
        self.notes = notes
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List {
                ForEach(notes, id: \.noteId) { note in
                    NoteItemCellView(note: note, onNoteItemDeleted: { item in
                    onNoteDeleted?(item)
                    })
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
