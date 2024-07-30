//
//  CalendarView.swift
//  Notes
//
//  Created by Amine Hajri on 26.07.24.
//

import SwiftUI

struct CalendarView: View {
    
    let title: String
    
    @Binding var showCalendar: Bool
    @State var selectedDate: Date = Date.today
    
    var onSelected: (Date) -> Void
    
    var body: some View {
        VStack {
            Button(title) {
                showCalendar = true
            }.popover(isPresented: $showCalendar) {
                DatePicker("Custom", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.graphical)
                    .onChange(of: selectedDate) {
                        onSelected(selectedDate)
                        showCalendar = false
                    }
            }
        }
    }
}

#Preview {
    CalendarView(title: "Title", showCalendar: .constant(true), onSelected: { _ in})
}
