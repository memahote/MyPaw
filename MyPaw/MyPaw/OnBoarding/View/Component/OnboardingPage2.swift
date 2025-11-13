//
//  OnboardingPage2.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage2: View {
    @Bindable var onboardingVM : OnboardingViewmodel
    
    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Quelques info en plus")
                    .font(.system(size: 26))
                    .foregroundStyle(.orangeDeep)
                    .padding(.top, 50)

                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .leading){
                        Text("Sexe")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        Picker(selection: $onboardingVM.profile.sexe, label: Text("")){
                            Text("Mâle").tag("Mâle")
                            Text("Femelle").tag("Femelle")
                        }
                        .pickerStyle(.segmented)
                        .background(.white)
                        .cornerRadius(25)


                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Poids")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        TextField("17kg", value: $onboardingVM.profile.weight, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    
                    VStack(alignment: .leading){
                        Text("N° Puce")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        TextField("645372998463-36645672", text: $onboardingVM.profile.microchip)
                            .textFieldStyle(.roundedBorder)
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
                        .disabled(!onboardingVM.isPage2Valid)
                        .opacity(onboardingVM.isPage2Valid ? 1 : 0.5)
                    }
                    .padding()

                }
            }
        }
    }
}

//#Preview {
//    OnboardingPage2(onboardingVM: .constant(OnboardingViewmodel()))
//}
