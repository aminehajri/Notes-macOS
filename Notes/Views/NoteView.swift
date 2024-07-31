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
    typealias NoteCompleted = ((NoteViewModel) -> Void)?
    
    var onNoteAdded: NoteAdded
    var onNoteDeleted: NoteDeleted
    var onNoteCompleted: NoteCompleted
    var notes: [NoteViewModel]
    
    init(onNoteAdded: NoteAdded = nil, onNoteDeleted: NoteDeleted = nil, onNoteCompleted: NoteCompleted = nil, notes: [NoteViewModel]) {
        self.onNoteAdded = onNoteAdded
        self.onNoteDeleted = onNoteDeleted
        self.onNoteCompleted = onNoteCompleted
        self.notes = notes
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List {
                ForEach(notes, id: \.noteId) { note in
                    NoteItemCellView(note: note, onNoteItemDeleted: { item in
                    onNoteDeleted?(item)
                    }, onNoteItemCompleted: { item in
                        onNoteCompleted?(item)
                    })
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
