//
//  NoteItemCellView.swift
//  Notes
//
//  Created by Amine Hajri on 26.07.24.
//

import SwiftUI

struct NoteItemCellView: View {
    
    @State private var isActive = false
    
    let note: NoteViewModel
    
    var onNoteItemDeleted : (NoteViewModel) -> Void = { _ in }
    
    var body: some View {
        
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: IconUtils.circle)
                .font(.system(size: 14))
                .opacity(0.2)
            
            VStack(alignment: .leading, content: {
                Text(note.title)
                
                if let dueDate = note.dueDate {
                    Text(dueDate.title)
                        .opacity(0.4)
                        .foregroundStyle(dueDate.isPastDue ? .red: .primary)
                }
                
            })
            
            Spacer()
            
            if isActive {
                Image(systemName: IconUtils.multiplyCircle)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        onNoteItemDeleted(note)
                    }
                
                Image(systemName: IconUtils.exclaimationMarkCircle).foregroundStyle(.purple)
            }
            
        }
        .contentShape(Rectangle())
        .onHover(perform: { value in
            isActive = value
            
        })
    }
}

#Preview {
    NoteItemCellView(note: NoteViewModel(note: Note()))
}
