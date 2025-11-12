//
//  OnboardingPage4.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage4: View {
    @State var onboardinVM = OnboardingViewmodel()

    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Deux petite question pour finir")
                    .font(.system(size: 22))
                    .foregroundStyle(.orangeDeep)
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .center){
                        Text("Votre animal est-t-il stériliser ?")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        Picker(selection: $onboardinVM.profile.isSterilized, label: Text("")){
                            Text("Oui")
                            Text("Non")
                        }.pickerStyle(.segmented)

                    }
                    
                }
                .padding()
                
                Spacer()
                
                //Valeur a changer
                ProgressBar(progress: 0.5)
                
                HStack{
                    Spacer()
                    NextButton(onJoin: {})
                }
                .padding()
            }
        }
    }
}

#Preview {
    OnboardingPage4()
}
