//
//  AuthViewModel.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 13/11/2025.
//

import Foundation
import Observation
import KeychainAccess

@Observable
final class AuthViewModel {
    var username: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var isLoading: Bool = false
    var errorMessage: String?
    var isLoggedIn: Bool = false
    var isRegister: Bool = false
    var showLoginView : Bool = false
    
    var token: String? {
        didSet {
            if let token = token {
                try? keychain.set(token, key: "authToken")
            } else {
                try? keychain.remove("authToken")
            }
        }
    }
    
    private let service = AuthService.shared
    private let keychain = Keychain(service: "com.mypaw.app")
    
    init() {
        if let savedToken = try? keychain.get("authToken") {
            token = savedToken
            isLoggedIn = true
        }
    }
    func login() async {
        isLoading = true
        errorMessage = nil
        do {
            let response = try await service.login(username: username, password: password)
            token = response.token
            isLoggedIn = true
        } catch {
            errorMessage = "Identifiant ou mot de passe incorrect"
        }
        isLoading = false
    }
    
    func register() async {
        isLoading = true
        errorMessage = nil
        do {
            try await service.register(username: username, password: password)
            isLoggedIn = true
            
        } catch {
            errorMessage = "Erreur d'inscription : \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    func logout() {
        token = nil
        isLoggedIn = false
        username = ""
        password = ""
    }
}
