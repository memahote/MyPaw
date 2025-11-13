//
//  AddEventPopUp.swift
//  MyPaw
//
//  Created by Emma on 13/11/2025.
//

import SwiftUI

struct AddEventPopUp: View {
    @Binding var dayVM: DaysViewModel
    @State var title: String = ""
    @State var description: String = ""
    @State var date: Date = Date.now
    @State var animal: [AnimalProfile] = []
    @State var typeEvent: EventEnum = .vaccins
    @Binding var popup : Bool
    @FocusState var isFocused: Bool
    var body: some View {
        ZStack {
            VStack() {
                Text("Ajouter un événement")
                    .font(.title2)
                    .padding(.bottom)
                
                List {
                    Picker("Type", selection: $typeEvent) {
                        Text("Vaccins").tag(EventEnum.vaccins)
                        Text("Médicaments").tag(EventEnum.medicaments)
                        Text("Rendez-vous").tag(EventEnum.rendezvous)
                        Text("Toiletteur").tag(EventEnum.toiletteur)
                        Text("autre").tag(EventEnum.autre)
                    }
                }.scrollContentBackground(.hidden)
                    .frame(height: 110)
                
                Text("Pour qui ?")
                
                HStack{
                    SelectAnimalComponent(animal: $animal, name: "Clover")
                    SelectAnimalComponent(animal: $animal, name: "Sam")
                    SelectAnimalComponent(animal: $animal, name: "Alex")
                    
                }
                .padding(.vertical)
                TextField("Choisissez un titre", text: $title)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .focused($isFocused)
                
                TextField("Décrivez votre événement", text: $description)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.vertical)
                    .focused($isFocused)
                
                DatePicker("", selection: $date, displayedComponents: [.date])
                    .tint(.orangeDeep)
                
                
                
                
                Button(action: {
                    dayVM.days.append(DayModel(id: UUID(), date: date, event: [Event(title: title, description: description, type: typeEvent, animal: animal)]))
                    
                    popup.toggle()
                }, label: {
                    Text("Ajouter")
                        .padding()
                        .background(.orangeDeep)
                        .foregroundStyle(.whiteDirt)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                })
                .padding()
                
            }
            .padding(30)
            .background(.whiteDirt)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding()
            .onTapGesture {
                isFocused = false
            }
        }
        
    }
}

#Preview {
    AddEventPopUp(dayVM: .constant(DaysViewModel()), popup: .constant(true))
}
