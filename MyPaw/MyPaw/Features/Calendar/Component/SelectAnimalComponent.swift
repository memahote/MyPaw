//
//  SelectAnimalComponent.swift
//  MyPaw
//
//  Created by Emma on 13/11/2025.
//

import SwiftUI

struct SelectAnimalComponent: View {
    @Binding var animal: [AnimalProfile]
    @State var isSelect: Bool = false
    @State var name: String
    var body: some View {
        Button(action: {
            isSelect.toggle()
            
            if isSelect {
                animal.append(AnimalProfile(name: name))
            }
            
            else{
                if !animal.isEmpty{
                    animal.removeAll { $0.name == name }

                }
            }
            
        }, label: {
            HStack{
                Circle().fill(.pinkNose)
                    .frame(width: 10)
                
                Text(name)
            }
            .padding(5)
            .padding(.horizontal, 3)
            .background(isSelect ? Color.orangeMid : Color.orangeMid.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }).foregroundStyle(.whiteDirt)
    }
}

#Preview {
    SelectAnimalComponent(animal: .constant([]), name: "Clover")
}
