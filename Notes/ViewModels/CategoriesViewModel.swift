//
//  CategoriesViewModel.swift
//  Notes
//
//  Created by Amine Hajri on 25.06.24.
//

import Foundation
import SwiftUI
import CoreData

class CategoriesViewModel: NSObject, ObservableObject {
    
    @Published var categories = [CategoryViewModel]()
    
    private let fetchedResultsController: NSFetchedResultsController<Category>
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        
        self.context = context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Category.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        fetchAll()
    }
    
    func saveTo(category: CategoryViewModel, title: String, dueDate: Date?) {
        
        let note = Note(context: context)
        note.title = title
        note.dueDate = dueDate
        note.category = Category.byId(id: category.id)
        
        do {
            try note.save()
        } catch {
            print(error)
        }
    }
    
    func delete(category: CategoryViewModel) {
        let category: Category? = Category.byId(id: category.id)
        if let category = category {
            try? category.delete()
        }
    }
    
    func deleteNote(_ note: NoteViewModel) {
        
        let note: Note? = Note.byId(id: note.noteId)
        if let note = note {
           try? note.delete()
        }
        
    }
    
    private func fetchAll() {
        do {
            try fetchedResultsController.performFetch()
            guard let categories = fetchedResultsController.fetchedObjects else {
                return
            }
            self.categories = categories.map(CategoryViewModel.init)
            
        } catch {
            print(error)
        }
        
    }
    
}

extension CategoriesViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        
        guard let categories = controller.fetchedObjects as? [Category] else {
            return
        }
        
        self.categories = categories.map(CategoryViewModel.init)
    }
}
