//
//  OnboardingModels.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import Foundation


struct AnimalProfile: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var species: String = ""
    var breed: String = ""
    var sexe: String = ""
    var weight: Double = 0.0
    var microchip: String = ""
    var birthDate: Date = Date()
    var lastVaccineDate: Date = Date()
    var isSterilized: Bool = false
    var isFollowingTreatment: Bool = false
    var currentTreatment: String = ""
}
