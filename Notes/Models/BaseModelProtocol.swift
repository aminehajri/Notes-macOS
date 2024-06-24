//
//  BaseModelProtocol.swift
//  Notes
//
//  Created by Amine Hajri on 24.06.24.
//

import Foundation
import CoreData

protocol BaseModelProtocol {
    
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
}

extension BaseModelProtocol where Self: NSManagedObject {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
}
