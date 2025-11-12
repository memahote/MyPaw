//
//  DayModel.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation

struct DayModel: Identifiable {
    var id: UUID
    var date: Date
    var event: [Event]
}
