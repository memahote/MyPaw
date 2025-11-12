//
//  OnboardingPage4.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage4: View {
    @Binding var onboardingVM : OnboardingViewmodel
    
    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Encore un petit effort pour votre animal !")
                    .font(.system(size: 26))
                    .foregroundStyle(.orangeDeep)

                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .center){
                        Text("Votre animal est-t-il stérilisé ?")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        Picker(selection: $onboardingVM.profile.isSterilized, label: Text("")){
                            Text("Oui").tag(true)
                            Text("Non").tag(false)
                        }
                        .pickerStyle(.segmented)
                        .background(.white)
                        .cornerRadius(10)

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
        }
    }
}

#Preview {
    OnboardingPage4(onboardingVM: .constant(OnboardingViewmodel()))
}
