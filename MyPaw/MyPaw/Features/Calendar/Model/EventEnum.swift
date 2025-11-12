//
//  EventEnum.swift
//  MyPaw
//
//  Created by Emma on 12/11/2025.
//

import Foundation
import SwiftUI

enum EventEnum{
    case vaccins, medicaments, toiletteur, rendezvous, autre
    
    var color: Color{
        switch self {
        case .vaccins:
            return .darkBrown
        case .medicaments:
            return .orangeDeep
        case .toiletteur:
            return .greenLight
            case .rendezvous:
            return .blueLight
        case .autre:
            return .pinkNose
        }
    }
}
