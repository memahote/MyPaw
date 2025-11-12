//
//  ProgressbarCustom.swift
//  MyPaw
//
//  Created by Lucie Grunenberger  on 12/11/2025.
//

import SwiftUI

struct ProgressBarCustom: View {
    
    var total: Int

    var body: some View {
    
        ZStack{
            Rectangle()
                .frame(width: 300, height: 20)
                .cornerRadius(20)
                .foregroundStyle(Color.orangeMid.opacity(0.2))
            
            HStack{
                Rectangle()
                    .frame(width: CGFloat(total > 100 ? 300 : total * 300 / 100), height: 20)
                    .foregroundStyle(total < 25 ? Color.redLight : total < 50 ? Color.orangeDeep : total < 75 ? Color.orangeMid : Color.greenLight )
                    .cornerRadius(20)
                
                Spacer()
                
            }
            
        }
        .frame(width: 200, height: 20)


    }
}

#Preview {
    ProgressBarCustom(total : 76)
}
