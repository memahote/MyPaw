//
//  Animal.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation

struct Animal: Identifiable{
    var id: UUID = UUID()
    var name: String
    var sexe: String
    var sterelised: Bool
    var espece: String
    var race: String
}
