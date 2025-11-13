//
//  PopUpLegendeView.swift
//  MyPaw
//
//  Created by Emma on 13/11/2025.
//

import SwiftUI

struct PopUpLegendeView: View {
    var body: some View {
        
        
        VStack(alignment: .leading) {
            ForEach(EventEnum.allCases, id: \.self){ event in
                HStack{
                    Circle().fill(event.color).frame(width: 20)
                    
                    Text("\(event)")
                }
                
            }
        }
        .padding(30)
        .background(.whiteDirt)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        
    }
}

#Preview {
    PopUpLegendeView()
}
