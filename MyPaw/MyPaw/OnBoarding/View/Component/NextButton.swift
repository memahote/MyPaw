//
//  NextButton.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct NextButton: View {
    let onJoin: () -> Void
    var body: some View {
        Button (action: onJoin) {
            Text("Suivant")
                .foregroundStyle(.white)
                .frame(width: 115, height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.orangeMid)
                )
                
        }
        .frame(height: 55)

    }
}

#Preview {
    NextButton(onJoin: { })
}
