//
//  UserDataViewModel.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import Foundation

@Observable
class UserDataViewModel {
    var animals : [AnimalProfile] = []
    
    func addAnimal(animal : AnimalProfile){
        animals.append(animal)
    }
    
    //Fonction pour update les info de l'animal ?
}
