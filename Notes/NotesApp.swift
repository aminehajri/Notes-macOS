//
//  NotesApp.swift
//  Notes
//
//  Created by Amine Hajri on 23.06.24.
//

import SwiftUI

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext
            HomeView().environment(\.managedObjectContext, viewContext)
        }
    }
}
