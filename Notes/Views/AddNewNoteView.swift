//
//  AddNewNoteView.swift
//  Notes
//
//  Created by Amine Hajri on 25.07.24.
//

import SwiftUI

struct AddNewNoteView: View {
    
    @State private var title: String = ""
    @State private var dueDate: DueDate?
    
    var onSave: (String, Date?) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: IconUtils.circle)
                    .font(.system(size: 14))
                    .opacity(0.2)
                TextField("", text: $title)
            }
            
            Text("Notes")
                .opacity(0.2)
                .padding(.leading, 30)
            
            HStack {
                
                DueDateSelectionView(dueDate: $dueDate)
                
                if dueDate != nil {
                    Button("Clear") {
                        dueDate = nil
                    }
                }
                
                Button("Save") {
                    if !title.isEmpty {
                        onSave(title, dueDate?.value)
                        title = ""
                        dueDate = nil
                    }
                }
                
            }.padding()
        }
    }
}

#Preview {
    AddNewNoteView(onSave: {_, _ in })
}
