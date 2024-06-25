//
//  AddNewListViewModel.swift
//  Notes
//
//  Created by Amine Hajri on 24.06.24.
//

import Foundation
import SwiftUI

class AddNewListViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var color: Color = .blue
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        
        do {
            let note = Category(context: context)
            note.name = name
            note.color = NSColor(color)
            try note.save()
        } catch {
            print(error)
        }
    }
}
