//
//  OnboardingView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingView: View {
    @Bindable var onboardingVM : OnboardingViewmodel
    @Bindable var animalData : AnimalDataViewModel
    @State var showSuccessAnimation = false
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    
    
        
    var body: some View {
        
        ZStack {
            Color(.darkBrown).ignoresSafeArea()
            
            VStack {
                TabView(selection: $onboardingVM.currentPage) {
                    OnboardingPage1(onboardingVM: onboardingVM)
                        .tag(0)
                    OnboardingPage2(onboardingVM: onboardingVM)
                        .tag(1)
                    OnboardingPage3(onboardingVM: onboardingVM)
                        .tag(2)
                    OnboardingPage4(onboardingVM: onboardingVM)
                        .tag(3)
                    OnboardingPage5(onboardingVM: onboardingVM) {
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
                            showOnboarding = false
                        }
                    }
            }
        }
    }
}


#Preview {
    OnboardingView(onboardingVM: OnboardingViewmodel(), animalData: AnimalDataViewModel())
}



extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func onTapOutsideToDismissKeyboard() -> some View {
        self.onTapGesture {
            hideKeyboard()
        }
    }
}
