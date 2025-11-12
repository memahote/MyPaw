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
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                
                Text("Deux petite question pour finir")
                    .font(.system(size: 22))
                    .foregroundStyle(.orange)
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .center){
                        Text("Votre animale est-t-il stériliser ?")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        Picker(selection: $onboardinVM.profile.sexe, label: Text("")){
                            Text("Oui")
                            Text("Non")
                        }.pickerStyle(.segmented)

                    }
                    
                }
                .padding()
                
                Spacer()
                
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
