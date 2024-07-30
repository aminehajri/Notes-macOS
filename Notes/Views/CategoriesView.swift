//
//  CategoriesView.swift
//  Notes
//
//  Created by Amine Hajri on 26.06.24.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var categoriesViewModel: CategoriesViewModel
    
    init(categoriesViewModel: CategoriesViewModel) {
        _categoriesViewModel = StateObject(wrappedValue: categoriesViewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            List {
                AllNotesCountView(count: categoriesViewModel.allNotesCount())
                Text("My Lists").foregroundStyle(.teal)
                ForEach(categoriesViewModel.categories) { category in
                    
                    NavigationLink {
                        CategoryHeaderView(name: category.name, count: category.notesCount, color: category.color)
                        
                        NoteView(onNoteAdded: { title, dueDate in
                            categoriesViewModel.saveTo(category: category, title: title, dueDate: dueDate)
                        }, onNoteDeleted: categoriesViewModel.deleteNote ,onNoteCompleted: categoriesViewModel.markAsCompleted, notes: category.notes)
                    } label: {
                        HStack {
                            Image(systemName: IconUtils.line3HorizontalCircleFill)
                                .font(.title)
                                .foregroundStyle(category.color)
                            Text(category.name)
                            Spacer()
                            Text("\(category.notesCount)")
                        }.contextMenu {
                            Button {
                                categoriesViewModel.delete(category: category)
                            } label: {
                                Text("Delete")
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    let context = CoreDataManager.shared.persistentContainer.viewContext
    return CategoriesView(categoriesViewModel: CategoriesViewModel(context: context))
}
