//
//  ScannerViewModel.swift
//  MyPaw
//
//  Created by Lucie Grunenberger  on 12/11/2025.
//

import Foundation
import Combine
import VisionKit


@MainActor
class ScannerViewModel: ObservableObject {
    @Published var lastScannedCode: String?
    @Published var navigateTo: String?

    // Pour DataScannerViewController
    func handleScan(_ item: RecognizedItem) {
        if case .barcode(let barcode) = item {
            lastScannedCode = barcode.payloadStringValue
            print("Code scanné (DSC) : \(lastScannedCode ?? "")")
        }
    }

    // Pour AVFoundation
    func handleScan(_ code: String) {
        lastScannedCode = code
        print("Code scanné (AVF) : \(code)")
        processNavigation(for: code)
    }
    
    // Logique de navigation centralisée
    private func processNavigation(for code: String) {
        switch code {
        case "4260379446977":
            navigateTo = "catz"
        case "4260379443129":
            navigateTo = "meatz"
        default:
            navigateTo = nil
        }
    }

}
