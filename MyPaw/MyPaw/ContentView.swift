//
//  ContentView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI


struct ContentView: View {
    @State private var authVM = AuthViewModel()
    @State private var onboardingVM = OnboardingViewmodel()
    @State private var animalData = AnimalDataViewModel()
    
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "orangeMid")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    
    var body: some View {
        
        Group {
            let _ = print("1er print \(authVM.isRegister) et  \(showOnboarding)")
            if !authVM.isLoggedIn {
                AuthView(authVM: authVM)
            } else {
                let _ = print("\(authVM.isRegister) et  \(showOnboarding)")
                if authVM.isRegister && showOnboarding {
                    OnboardingView(onboardingVM: onboardingVM, animalData: animalData)
                } else {
                    TestDataView(animalData: animalData, authVM: authVM)
                }
            }
        }
        .animation(.easeInOut, value: authVM.isLoggedIn)
    }
}

#Preview {
    ContentView()
}
