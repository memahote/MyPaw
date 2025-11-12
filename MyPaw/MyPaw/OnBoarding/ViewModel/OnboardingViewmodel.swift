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
    
    func nextPage(){
        currentPage += 1
    }
    
    func previousPage(){
        if currentPage > 0 {
            currentPage -= 1
        }
    }
}
