//
//  Note.swift
//  Notes
//
//  Created by Amine Hajri on 24.06.24.
//

import Foundation
import CoreData
import AppKit

@objc(Category)
class Category: NSManagedObject, BaseModelProtocol {
    
    static var all: NSFetchRequest<Category> {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}


extension Category {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }
    
    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?
    
}

extension Category : Identifiable {
    
}
