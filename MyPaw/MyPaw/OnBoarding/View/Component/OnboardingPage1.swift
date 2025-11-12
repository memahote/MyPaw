//
//  OnboardingPage1.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingPage1: View {
    @Binding var onboardingVM : OnboardingViewmodel
    
    var body: some View {
        ZStack{

//            Image("imgOnboarding1")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
            
            Color(.darkBrown)
                .opacity(0.9)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("On apprend à vous connaître")
                    .font(.system(size: 26))
                    .foregroundStyle(.orangeDeep)
 
                
                Spacer()
                VStack(spacing: 45){
                    VStack(alignment: .leading){
                        Text("Nom")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)

                        TextField("Clover", text: $onboardingVM.profile.name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 285, height: 35)
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Espèce")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        
                        TextField("Chat", text: $onboardingVM.profile.species)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 285, height: 35)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Race")
                            .font(.system(size: 22))
                            .foregroundStyle(.orangeDeep)
                        TextField("Européen", text: $onboardingVM.profile.breed)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 285, height: 35)
                    }
                }
                .padding()
                
               Spacer()
                //Valeur a changer
                ProgressBar(progress: 0.5)
                
                VStack {
                    ProgressBar(progress: CGFloat(onboardingVM.currentPage + 1) / 5.0)
                    
                    
                    HStack{
                        Spacer()
                        NextButton {
                            onboardingVM.nextPage()
                        }
                        .disabled(!onboardingVM.isPage1Valid)
                        .opacity(onboardingVM.isPage1Valid ? 1 : 0.5)
                    }
                    .padding()
                    
                }
            }
        }
    }
}


#Preview {
    OnboardingPage1(onboardingVM: .constant(OnboardingViewmodel()))
}
