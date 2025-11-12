//
//  DaysViewModel.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation

@Observable
class DaysViewModel {
    var days: [DayModel] = [DayModel(id: UUID(), date: dateFromString("2025-11-19"), event: [Event(title: "Vaccin", type: .vaccins, animal: Animal(name: "Kiki", sexe: "Femelle", sterelised: false, espece: "Chat", race: "Européen"))]), DayModel(id: UUID(), date: Date.now.addingTimeInterval(83400), event: [])]
    
    func day(for date: Date) -> DayModel? {
            let cal = Calendar.current
            return days.first { cal.isDate($0.date, inSameDayAs: date) }
        }
}

func dateFromString(_ string: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: string) ?? Date.now
}

