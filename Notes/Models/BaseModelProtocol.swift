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
    func delete() throws
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?
}

extension BaseModelProtocol where Self: NSManagedObject {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
    
    static func byId<T>(id: NSManagedObjectID) -> T? {
        viewContext.object(with: id) as? T
    }
    
}
