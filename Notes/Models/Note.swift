//
//  Note.swift
//  Notes
//
//  Created by Amine Hajri on 24.06.24.
//

import Foundation
import CoreData
import AppKit

@objc(Note)
class Note: NSManagedObject, BaseModelProtocol {
    
}


extension Note {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }
    
    @NSManaged public var color: NSColor?
    @NSManaged public var name: String?
    
}

extension Note : Identifiable {
    
}
