//
//  ProgressBar.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct ProgressBar: View {
    let progress: CGFloat
    
    var body: some View {
        
        VStack (spacing: -20){
            HStack {
                Spacer()
                Image("kiki")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
                    .padding(.horizontal)
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
        .frame(height: 200)
        
    }
    
    
}


#Preview {
    ProgressBar(progress: 0.5)
}
