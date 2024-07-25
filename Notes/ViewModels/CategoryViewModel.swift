//
//  CategoryViewModel.swift
//  Notes
//
//  Created by Amine Hajri on 26.06.24.
//

import Foundation
import CoreData
import SwiftUI

struct CategoryViewModel: Identifiable {
    
    private let category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    var id: NSManagedObjectID {
        category.objectID
    }
    
    var name: String {
        category.name ?? "Unknown"
    }
    
    var color: Color {
        Color(category.color ?? .clear)
    }
    
    var notesCount: Int {
        notes.count
    }
    
    var notes: [NoteViewModel] {
        guard let notes = category.notes,
              let myNotes = notes.allObjects as? [Note]
        else {
            return []
        }
        
        return myNotes.filter { $0.isCompleted == false }.map(NoteViewModel.init)
    }
}
