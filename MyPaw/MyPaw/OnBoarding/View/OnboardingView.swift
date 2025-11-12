//
//  OnboardingView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State var text : String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Nom")
            TextField("Entrer le nom de votre animal", text: $text)
                .textFieldStyle(.roundedBorder)
                
            Text("Espèce")
            TextField("Entrer l'espèce de votre animal", text: $text)
                .textFieldStyle(.roundedBorder)
            
            Text("Race")
            TextField("Entrer la race de votre animal", text: $text)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
