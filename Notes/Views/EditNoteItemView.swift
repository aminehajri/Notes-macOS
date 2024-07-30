//
//  EditNoteItemView.swift
//  Notes
//
//  Created by Amine Hajri on 26.07.24.
//

import SwiftUI

struct EditNoteItemView: View {
    
    var note: NoteViewModel
    var onUpdated: () -> Void
    
    @State private var selectedDate: Date = Date.today
    @State private var showCalendar = false
    @ObservedObject var editNoteViewModel: EditNoteViewModel
    
    init(note: NoteViewModel, onUpdated: @escaping () -> Void) {
        self.note = note
        self.onUpdated = onUpdated
        editNoteViewModel = EditNoteViewModel(noteViewModel: note)
    }
    
    var calendarDateTitle: String {
        editNoteViewModel.selectedDate != nil ? editNoteViewModel.selectedDate!.formatAsString: "Add date"
    }
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            TextField(note.title, text: $editNoteViewModel.title)
                .textFieldStyle(.plain)
            
            Divider()
            
            HStack {
                Text("Due Date:")
                CalendarView(title: calendarDateTitle, showCalendar: $showCalendar, onSelected: { selectedDate in
                    editNoteViewModel.selectedDate = selectedDate
                    
                })
            }
            
            Spacer()
            HStack {
                Spacer()
                Button("Done", action: {
                    editNoteViewModel.save()
                    onUpdated()
                }).buttonStyle(.borderedProminent)
            }
        }).padding()
            .frame(minWidth: 200, minHeight: 200)
    }
}

#Preview {
    EditNoteItemView(note: NoteViewModel(note: Note()), onUpdated: {})
}
