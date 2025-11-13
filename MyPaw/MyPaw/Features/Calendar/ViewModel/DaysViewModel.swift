//
//  DaysViewModel.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation

@Observable
class DaysViewModel {
    var sam : AnimalProfile
    
    var alex : AnimalProfile
    
    var clover : AnimalProfile
    
    var days: [DayModel]
    
    init(){
        let sam = AnimalProfile(name: "Sam")
        let clover = AnimalProfile(name: "Clover")
        let alex = AnimalProfile(name: "Alex")
        self.sam = sam
        
        self.alex = alex
        
        self.clover = clover
        
        self.days = [
            DayModel(id: UUID(), date: dateFromString("2025-11-19"), event: [Event(title: "Vaccin", description: "C'est l'heure des vaccins !", type: .vaccins, animal: [clover])]),
            
            DayModel(id: UUID(), date: dateFromString("2025-11-13"), event: [Event(title: "Visite à Simplon", description: "Les totallies Spies débarquent à Simplon ! 😸😼😽", type: .autre, animal: [sam, clover, alex])]),
            
            DayModel(id: UUID(), date: dateFromString("2025-12-10"), event: [Event(title: "Vermifuge", description: "Il est temps de renouveller les vermifuges !", type: .medicaments, animal: [sam, clover, alex])]),
            
            DayModel(id: UUID(), date: dateFromString("2025-11-22"), event: [Event(title: "Toilettage🪮", description: "Sam va se refaire une beauté", type: .toiletteur, animal: [sam])]),
            
            DayModel(id: UUID(), date: dateFromString("2025-11-29"), event: [Event(id: UUID(), title: "Chicha la team", description: "Rendez-vous chicha", type: .rendezvous, animal: [sam, clover])])
        
        
        ]
    }
    
    
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

