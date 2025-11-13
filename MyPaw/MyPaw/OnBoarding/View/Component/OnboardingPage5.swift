//
//  OnboardingPage5.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage5: View {
    @Bindable var onboardingVM : OnboardingViewmodel
    var onFinish: () -> Void
 
    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Dernière petite question 🤔")
                    .font(.system(size: 26))
                    .foregroundStyle(.orangeDeep)
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .center){
                        Text("Votre animal suit-il un traitement ?")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        Picker(selection: $onboardingVM.profile.isFollowingTreatment, label: Text("")){
                            Text("Oui").tag(true)
                            Text("Non").tag(false)
                        }
                        .pickerStyle(.segmented)
                        .background(.white)
                        .cornerRadius(10)
                        
                    }
                    
                    if onboardingVM.profile.isFollowingTreatment {
                        VStack(alignment: .leading, spacing: 10){
                            Text("Quel traitement ?")
                                .font(.system(size: 18))
                                .foregroundStyle(.orangeDeep)
                            
                            TextField("Nom du traitement", text: $onboardingVM.profile.currentTreatment)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 285, height: 35)
                        }

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
                        NextButton(text: "Terminer") {
                            onFinish()
                        }
                        .disabled(!onboardingVM.isPage5Valid)
                        .opacity(onboardingVM.isPage5Valid ? 1 : 0.5)
                    }
                    .padding()
              
                }

            }
            .onTapOutsideToDismissKeyboard()
        }
    }
}

//#Preview {
//    OnboardingPage5(onboardingVM: .constant(OnboardingViewmodel()), onFinish: {})
//
//}
