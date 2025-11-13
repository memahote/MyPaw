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
                    MainTabViewWithData(animalData: animalData, authVM: authVM)
                }
            }
        }
        .animation(.easeInOut, value: authVM.isLoggedIn)
    }
    // MARK: - Main Tab Container avec données
    struct MainTabViewWithData: View {
        @State private var selectedTab: TabItem = .calendar
        var animalData: AnimalDataViewModel
        var authVM: AuthViewModel
        
        var body: some View {
            ZStack(alignment: .bottom) {
                // Content selon l'onglet sélectionné
                Group {
                    switch selectedTab {
                    case .profil:
                        ProfilView()
                    case .scanner:
                        YukaScannerView()
                    case .calendar:
                        CalendarCustomView()
                    case .forum:
                        ForumsView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // TabBar personnalisée
                CustomTabBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .environment(animalData)
            .environment(authVM)
        }
    }
}

#Preview {
    ContentView()
}
