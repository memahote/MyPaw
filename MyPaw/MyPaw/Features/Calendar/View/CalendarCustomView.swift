//
//  CalendarView.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import SwiftUI
import HorizonCalendar


struct CalendarCustomView: View {
    @State private var month = Date()
    @State private var selectedDate: Date?
    @State var vm = DaysViewModel()
    @State private var detailDay: DayModel?
    var body: some View {
        CalendarMonth(
            month: $month,
            dayFor: { date in vm.day(for: date) },
            onSelect: { date in
                selectedDate = date
                let cal = Calendar.current
                let today = cal.startOfDay(for: Date())
                let dayStart = cal.startOfDay(for: date)
                
                if let d = vm.day(for: date),
                   dayStart <= today {
                    detailDay = d
                } else {
                    detailDay = nil
                }
            }
        )
        
        
        
    }
}

#Preview {
    CalendarCustomView()
}
