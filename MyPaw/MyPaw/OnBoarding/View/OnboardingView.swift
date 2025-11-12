//
//  OnboardingView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State var onboardingVM = OnboardingViewmodel()
    @State var animalData = AnimalDataViewModel()
    @State var showSuccessAnimation = false
    @State var isOnboardingComplete = false

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "orangeMid")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some View {
        
        if isOnboardingComplete {
            TestDataView(animalData: animalData)
        } else {
            ZStack {
                Color(.darkBrown).ignoresSafeArea()
                
                VStack {
                    TabView(selection: $onboardingVM.currentPage) {
                        OnboardingPage1(onboardingVM: $onboardingVM)
                            .tag(0)
                        OnboardingPage2(onboardingVM: $onboardingVM)
                            .tag(1)
                        OnboardingPage3(onboardingVM: $onboardingVM)
                            .tag(2)
                        OnboardingPage4(onboardingVM: $onboardingVM)
                            .tag(3)
                        OnboardingPage5(onboardingVM: $onboardingVM) {
                            animalData.addAnimal(animal: onboardingVM.profile)
                            showSuccessAnimation = true
                        }
                        .tag(4)
                        
                        
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    
                    
                }
                .fullScreenCover(isPresented: $showSuccessAnimation) {
                    OnboardingAnim(animal: onboardingVM.profile)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                showSuccessAnimation = false
                                isOnboardingComplete = true
                            }
                        }
                }
            }
        }
    }
}


#Preview {
    OnboardingView()
}
