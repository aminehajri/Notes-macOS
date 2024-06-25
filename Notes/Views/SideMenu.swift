//
//  SideMenu.swift
//  Notes
//
//  Created by Amine Hajri on 23.06.24.
//

import SwiftUI

struct SideMenu: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            List(1...5, id: \.self) { index in
                Text("List \(index)")
            }
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                HStack {
                    Image(systemName: IconUtils.plusCircle)
                    Text("New list")
                }
            }.buttonStyle(.plain)
                .padding()
        }.sheet(isPresented: $isPresented) {
            
        } content: {
            AddNewListView(addNewListViewModel: AddNewListViewModel(context: context))
        }
        
    }
}

#Preview {
    SideMenu()
}
