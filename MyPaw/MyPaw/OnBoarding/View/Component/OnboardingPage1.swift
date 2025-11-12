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
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                
                Text("On apprend à vous connaître")
                    .font(.system(size: 22))
                    .foregroundStyle(.orange)
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .leading){
                        Text("Nom")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        TextField("Clover", text: $onboardinVM.profile.name)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Espèce")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        TextField("Chat", text: $onboardinVM.profile.species)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Race")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        TextField("Européen", text: $onboardinVM.profile.breed)
                            .textFieldStyle(.roundedBorder)
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
    OnboardingPage1()
}
