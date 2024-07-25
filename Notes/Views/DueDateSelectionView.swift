//
//  DueDateSelectionView.swift
//  Notes
//
//  Created by Amine Hajri on 25.07.24.
//

import SwiftUI

struct DueDateSelectionView: View {
    
    @Binding var dueDate: DueDate?
    @State private var selectedDate: Date = Date.today
    @State private var showCalendar: Bool = false
    
    var body: some View {
        Menu {
            Button {
                dueDate = .today
            } label: {
                VStack {
                    Text("Today \n \(Date.today.formatAsString)")
                }
            }
            
            Button {
                dueDate = .tomorrow
            } label: {
                VStack {
                    Text("Tomorrow \n \(Date.tomorrow.formatAsString)")
                }
            }
            
            Button {
                showCalendar = true
            } label: {
                Text("Custom")
            }
            
        } label: {
            Label(dueDate == nil ? "Add Date:" : dueDate!.title, systemImage: "calendar")
        }.menuStyle(.borderedButton)
            .fixedSize()
            .popover(isPresented: $showCalendar) {
                DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .onChange(of: selectedDate) {
                        dueDate = .custom(selectedDate)
                        showCalendar = false
                    }
            }
    }
}

#Preview {
    DueDateSelectionView(dueDate: .constant(nil))
}
