//
//  KikiHeadBobble.swift
//  MyPaw
//
//  Created by Larderet on 12/11/2025.
//
import SwiftUI

struct KikiGrumpyBobble: View {
    @State private var headTilt: CGFloat = 0
    @State private var bobUp: Bool = false

    var body: some View {
        ZStack {
            // Corps du chat
            Image("kikiBody")
                .resizable()
                .scaledToFit()
                .frame(width: 160)

            // Tête du chat
            Image("kikiGrumpy")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .offset(x: -40, y: -100) // ajustement
                .rotationEffect(.degrees(headTilt))
                .animation(
                    .easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: true),
                    value: headTilt
                )
                .onAppear {
                    headTilt = 5 // angle de rotation
                }
        }
        .frame(width: 100, height: 150)
    }
}

#Preview {
    ZStack {
        Color(.systemBackground)
            .ignoresSafeArea()
        KikiGrumpyBobble()
    }
}
