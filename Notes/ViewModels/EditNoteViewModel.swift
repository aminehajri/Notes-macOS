//
//  EditNoteViewModel.swift
//  Notes
//
//  Created by Amine Hajri on 26.07.24.
//

import Foundation


class EditNoteViewModel: ObservableObject {
    
    var noteViewModel: NoteViewModel
    @Published var title: String = ""
    @Published var selectedDate: Date?
    
    init(noteViewModel: NoteViewModel) {
        self.noteViewModel = noteViewModel
        title = noteViewModel.title
        selectedDate = noteViewModel.dueDate != nil ? (noteViewModel.dueDate!.value): nil
    }
    
    func save() {
        let note: Note? = Note.byId(id: noteViewModel.noteId)
        if let note = note {
            note.title = title
            note.dueDate = selectedDate
            try? note.save()
        }
    }
}
