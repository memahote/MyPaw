//
//  OnboardingAnim.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingAnim: View {
    @State private var fillAmount: CGFloat = 0
    @State private var scale: CGFloat = 0.8
    @State private var showText = false
    let animal: AnimalProfile
    
    var body: some View {
        ZStack {
            Color.darkBrown.ignoresSafeArea()
            
            VStack(spacing: 40) {
                ZStack {
                    Image(systemName: "heart")
                        .font(.system(size: 120))
                        .foregroundStyle(.orangeMid)
                    
                    Image(systemName: "heart.fill")
                        .font(.system(size: 120))
                        .foregroundStyle(.orangeDeep)
                        .mask(
                            Rectangle()
                                .frame(height: 120 * fillAmount)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        )
                }
                .scaleEffect(scale)
                
                if showText {
                    VStack(spacing: 10) {
                        Text("C'est parti ! 🎉")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(.orangeDeep)
                        
                        Text("\(animal.name)")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(.orangeDeep)
                        
                        Text("est maintenant dans MyPaw")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                fillAmount = 1
                scale = 1
            }
            
            withAnimation(.easeInOut(duration: 0.3).delay(1.2)) {
                scale = 1.15
            }
            
            withAnimation(.easeInOut(duration: 0.2).delay(1.5)) {
                scale = 1
            }
            
            withAnimation(.easeIn(duration: 0.3).delay(1.3)) {
                showText = true
            }
        }
    }
    
}

#Preview {
    OnboardingAnim(animal: AnimalProfile())
}
