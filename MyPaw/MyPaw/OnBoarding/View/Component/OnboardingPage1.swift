//
//  OnboardingPage1.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage1: View {
    @State var onboardinVM = OnboardingViewmodel()
    
    var body: some View {
        ZStack{
            Color(.darkBrown)
                .ignoresSafeArea()
            
            VStack {
                
                Text("On apprend à vous connaître")
                    .font(.system(size: 22))
                    .foregroundStyle(.orangeDeep)
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .leading){
                        Text("Nom")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        TextField("Clover", text: $onboardinVM.profile.name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 285, height: 35)
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Espèce")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        TextField("Chat", text: $onboardinVM.profile.species)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 285, height: 35)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Race")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        TextField("Européen", text: $onboardinVM.profile.breed)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 285, height: 35)
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
    OnboardingPage1()
}
