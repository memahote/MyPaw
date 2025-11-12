//
//  OnboardingViewmodel.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import Foundation

@Observable
class OnboardingViewmodel {
   var profile = AnimalProfile()
    var currentPage = 0
    
    var isPage1Valid: Bool {
        !profile.name.isEmpty && !profile.species.isEmpty && !profile.breed.isEmpty
    }
    
    var isPage2Valid: Bool {
        !profile.sexe.isEmpty && profile.weight > 0
    }
    
    var isPage5Valid: Bool {
        if profile.isFollowingTreatment {
            return !profile.currentTreatment.isEmpty
        }
        return true
    }
    
    func nextPage(){
        currentPage += 1
    }
    
    func previousPage(){
        if currentPage > 0 {
            currentPage -= 1
        }
    }
    
    
}
