//
//  CoreDataManager.swift
//  Notes
//
//  Created by Amine Hajri on 24.06.24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        
        ValueTransformer.setValueTransformer(NSColorTransformer(), forName: NSValueTransformerName("NSColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "NotesModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize NotesModel \(error)")
            }
        }
    }
}
