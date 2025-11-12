//
//  OnboardingPage2.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage2: View {
    @State var onboardinVM = OnboardingViewmodel()
    
    var body: some View {
        ZStack{
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                
                Text("Quelques info en plus")
                    .font(.system(size: 22))
                    .foregroundStyle(.orange)
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .leading){
                        Text("Sexe")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        Picker(selection: $onboardinVM.profile.sexe, label: Text("")){
                            Text("Male")
                            Text("Female")
                        }.pickerStyle(.segmented)

                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Poids")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        TextField("17kg", text: $onboardinVM.profile.species)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    VStack(alignment: .leading){
                        Text("N° Puce")
                            .font(.system(size: 22))
                            .foregroundStyle(.orange)
                        TextField("645372998463-36645672", text: $onboardinVM.profile.breed)
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
    OnboardingPage2()
}
