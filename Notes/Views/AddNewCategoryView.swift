//
//  AddNewListView.swift
//  Notes
//
//  Created by Amine Hajri on 25.06.24.
//

import SwiftUI

struct AddNewCategoryView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var addNewListViewModel: AddNewListViewModel
    
    init(addNewListViewModel: AddNewListViewModel) {
        self.addNewListViewModel = addNewListViewModel
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("New list")
                    .font(.headline)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Name: ")
                    TextField("", text: $addNewListViewModel.name)
                }
                
                HStack {
                    Text("Color:")
                    ColorListView(selectedColor: $addNewListViewModel.color)
                }
            }
            
            HStack {
                Spacer()
                Button("Cancel") {
                    dismiss.callAsFunction()
                }
                Button("Add") {
                    addNewListViewModel.save()
                    dismiss.callAsFunction()
                }.disabled(addNewListViewModel.name.isEmpty)
            }
            
        }.frame(minWidth: 300)
            .padding()
    }
}

#Preview {
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    return AddNewCategoryView(addNewListViewModel: AddNewListViewModel(context: viewContext))
}
