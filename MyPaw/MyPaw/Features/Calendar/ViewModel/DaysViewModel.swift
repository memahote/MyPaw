//
//  DaysViewModel.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation

@Observable
class DaysViewModel {
    var days: [DayModel] = [DayModel(id: UUID(), date: Date.now, event: ["Essaie"])]
    
    func day(for date: Date) -> DayModel? {
            let cal = Calendar.current
            return days.first { cal.isDate($0.date, inSameDayAs: date) }
        }
}
