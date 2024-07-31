//
//  HomeView.swift
//  Notes
//
//  Created by Amine Hajri on 23.06.24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var body: some View {
        NavigationSplitView {
            SideMenu()
                .frame(minWidth: 200)
            
        } detail: {
            let categoriesViewModel = CategoriesViewModel(context: context)
            let firstCategoryViewModel = categoriesViewModel.categories.first
            
            if let firstCategoryViewModel = firstCategoryViewModel {
                
                CategoryHeaderView(name: firstCategoryViewModel.name, count: firstCategoryViewModel.notesCount, color: firstCategoryViewModel.color)
                
                NoteView(notes: firstCategoryViewModel.notes)
            } else {
                Text("You don't have any list")
            }
        }
    }
}

#Preview {
    HomeView()
}
