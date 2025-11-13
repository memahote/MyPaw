//
//  TestView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct TestDataView: View {
    @Bindable var animalData: AnimalDataViewModel
    @Bindable var authVM: AuthViewModel
    @State var animaData = AnimalDataViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Animaux enregistrés: \(animalData.animals.count)")
                .font(.title)
            
            ForEach(animalData.animals) { animal in
                VStack(alignment: .leading, spacing: 5) {
                    Text("🐾 \(animal.name)")
                        .font(.headline)
                    Text("Espèce: \(animal.species)")
                    Text("Race: \(animal.breed)")
                    Text("Sexe: \(animal.sexe)")
                    Text("Poids: \(animal.weight)kg")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            
            NextButton(text: "LogOut") {
                authVM.logout()
            }
        }
        .padding()
    }
}

#Preview {
    TestDataView(animalData: AnimalDataViewModel(), authVM: AuthViewModel())
}
