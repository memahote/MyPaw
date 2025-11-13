//
//  ProgressBar.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI
import Combine

struct ProgressBar: View {
    let progress: CGFloat
    @State private var currentPoseIndex = 0
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack (){
            HStack {
                Spacer()
//                Image("kiki")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 75)
//                    .padding(.horizontal)
                
               
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
                                    .offset(y: 30)
                                
                                Image("kikiHead")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120)
                                    .offset(x: -15, y: -20)
                            }
                        } else if currentPoseIndex == 1 {
                            ZStack {
                                Image("kikiPawPose1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160)
                                    .transition(.opacity)
                                    .offset(x: -4,y: 30)
                                
                                Image("kikiHead")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120)
                                    .offset(x: -15, y: -20)
                            }
                        } else if currentPoseIndex == 2{
                            
                            ZStack {
                                Image("kikiPawPose2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160)
                                    .transition(.opacity)
                                    .offset(x: -7,y: 30)
                                
                                Image("kikiHead")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120)
                                    .offset(x: -15, y: -20)
                            }
                            
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: currentPoseIndex)
                }
                .onReceive(timer) { _ in
                    animateNextPose()
                }

            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: geometry.size.width, height: 20)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(
                            width: min(progress * geometry.size.width,
                                       geometry.size.width),
                            height: 20
                        )
                        .foregroundColor(.orangeMid)
                }
                
            }
            .padding()
            
            
        }
        .frame(height: 125)

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
    ProgressBar(progress: 0.5)
}
