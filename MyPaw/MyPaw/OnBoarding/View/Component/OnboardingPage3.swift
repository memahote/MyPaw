//
//  OnboardingPage3.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage3: View {
    @State var onboardinVM = OnboardingViewmodel()

    var body: some View {
        ZStack{
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                
                Text("Quelques dates clés")
                    .font(.system(size: 22))
                    .foregroundStyle(.orange)
                
                Spacer()
                VStack(spacing: 65){
                    VStack(alignment: .leading){
                        Text("Date de naissance")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        DatePicker(selection: $onboardinVM.profile.birthDate, in: ...Date(), displayedComponents: .date){
                            Text("Selectionnez une date :")
                                .foregroundStyle(.white)
                        }

                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Date du dernier vaccin")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        DatePicker(selection: $onboardinVM.profile.lastVaccineDate, in: ...Date(), displayedComponents: .date){
                            Text("Selectionnez une date :")
                                .foregroundStyle(.white)
                        }
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
    OnboardingPage3()
}
