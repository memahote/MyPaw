//
//  KikiPawMove.swift
//  MyPaw
//
//  Created by Larderet on 13/11/2025.
//

//
//  KikiHeadBobble.swift
//  MyPaw
//
//  Created by Larderet on 12/11/2025.
//

import SwiftUI

struct KikiPawMove: View {
    @State private var headTilt: CGFloat = 0
    @State private var bobUp: Bool = false

    var body: some View {
        ZStack {
            // Corps du chat
            Image("kikiPawPose0")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
            
            Image("kikiPawPos1")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                .offset(x: -10)

            Image("kikiPawPos2")
                .resizable()
                .scaledToFit()
                .frame(width: 160)

            // Tête du chat
            Image("kikiHead")
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
        .frame(width: 200, height: 250)
    }
}

#Preview {
    ZStack {
        Color(.systemBackground)
            .ignoresSafeArea()
        KikiPawMove()
    }
}
