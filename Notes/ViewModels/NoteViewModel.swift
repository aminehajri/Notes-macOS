//
//  NoteViewModel.swift
//  Notes
//
//  Created by Amine Hajri on 27.06.24.
//

import Foundation
import CoreData

class NoteViewModel: Identifiable {
    
    private let note: Note
    let id = UUID()
    
    init(note: Note) {
        self.note = note
    }
    
    var title: String {
        note.title ?? ""
    }
    
    var dueDate: DueDate? {
        if let date = note.dueDate {
            return DueDate.from(value: date)
        } else {
            return nil
        }
    }
    
    var isCompleted: Bool {
        note.isCompleted
    }
    
    var noteId: NSManagedObjectID {
        note.objectID
    }
}
