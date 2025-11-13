//
//  KikiHeadBobble.swift
//  MyPaw
//
//  Created by Larderet on 12/11/2025.
//

import SwiftUI
import Combine

struct KikiPawMove: View {
    @State private var currentPoseIndex = 0
    
    // Timer pour changer les poses
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // Animation des poses du chat
            Group {
                if currentPoseIndex == 0 {
                    ZStack {
                        
                        
                        Image("kikiPawPose0")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160)
                            .transition(.opacity)
                        
                        Image("kikiHead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x: -40, y: -100)
                    }
                } else if currentPoseIndex == 1 {
                    ZStack {
                        Image("kikiPawPose1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180)
                            .offset(x: -10)
                            .transition(.opacity)
                        
                        Image("kikiHead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x: -40, y: -100)
                    }
                } else if currentPoseIndex == 2{
                    
                    ZStack {
                        Image("kikiPawPose2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 198)
                            .transition(.opacity)
                            .offset(x: -18)
                        
                        Image("kikiHead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(x: -40, y: -100)
                    }
                    
                }
            }
            .animation(.easeInOut(duration: 0.2), value: currentPoseIndex)
        }
        .onReceive(timer) { _ in
            animateNextPose()
        }
    }
    
    private func animateNextPose() {
        // Séquence: 0 -> 1 -> 2 -> 1 -> 0 -> 1 -> 2...
        switch currentPoseIndex {
        case 0:
            currentPoseIndex = 1
        case 1:
            currentPoseIndex = 2
        case 2:
            currentPoseIndex = 0
        default:
            currentPoseIndex = 0
        }
    }
}

#Preview {
    KikiPawMove()
        .padding()
}
