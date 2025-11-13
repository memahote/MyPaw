//
//  OnboardingPage3.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage3: View {
    @Bindable var onboardingVM : OnboardingViewmodel
    
    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Quelques dates clés")
                    .font(.system(size: 26))
                    .foregroundStyle(.orangeDeep)
                    .padding(.top, 50)
                
                Spacer()
                VStack(spacing: 65){
                    VStack(alignment: .leading){
                        Text("Date de naissance")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        DatePicker(selection: $onboardingVM.profile.birthDate, in: ...Date(), displayedComponents: .date){
                            Text("Selectionnez une date :")
                                .foregroundStyle(.white)
                        }
                        .colorScheme(.dark)
                        .tint(.orangeMid)
                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Date du dernier vaccin")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        DatePicker(selection: $onboardingVM.profile.lastVaccineDate, in: ...Date(), displayedComponents: .date){
                            Text("Selectionnez une date :")
                                .foregroundStyle(.white)
                        }
                        .colorScheme(.dark)
                        .tint(.orangeMid)
                    }
                    
                }
                .padding()
                
                Spacer()
                
                VStack {
                    ProgressBar(progress: CGFloat(onboardingVM.currentPage + 1) / 5.0)
                      
                    
                    HStack{
                        NextButton(text: "Précédent") {
                            onboardingVM.previousPage()
                        }
                        Spacer()
                        NextButton {
                            if (onboardingVM.currentPage < 4) {
                                onboardingVM.nextPage()
                            }
                        }
                    }
                    .padding()
              
                }
            }
            .onTapOutsideToDismissKeyboard()
        }
    }
}

//#Preview {
//    OnboardingPage3(onboardingVM: .constant(OnboardingViewmodel()))
//}
