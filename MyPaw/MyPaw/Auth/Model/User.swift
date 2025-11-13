//
//  User.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import Foundation


struct User: Codable, Identifiable {
    var id: UUID = UUID()
    var username: String = ""
    var password : String = ""
}
