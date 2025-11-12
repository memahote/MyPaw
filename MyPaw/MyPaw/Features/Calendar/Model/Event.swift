//
//  Event.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation

struct Event: Identifiable{
    var id: UUID = UUID()
    var title: String
   
    var type: EventEnum
    var animal: Animal
}
