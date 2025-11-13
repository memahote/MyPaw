//
//  RegisterView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct RegisterView: View {
    @Bindable var authVM: AuthViewModel
    @AppStorage("showOnboarding") var showOnboarding : Bool = true
    var body: some View {
        ZStack{
            Image("BackgroundProfil")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                Text("Je m'enregistre")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundStyle(.whiteDirt)
                    .padding()
                
                TextField("Nom d'utilisateur", text: $authVM.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Mot de passe", text: $authVM.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Confirmer le Mot de passe", text: $authVM.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                NextButton(text: "C'est Parti !") {
                    Task {
                        await authVM.register()
                    }
                    authVM.isRegister = true
                    authVM.isLoggedIn = true
                    showOnboarding = true
                }
                
                Button {
                    authVM.showLoginView = true
                } label: {
                    Text("Me connecter")
                        .foregroundStyle(.orangeMid)
                }
            }
            .onTapOutsideToDismissKeyboard()
            .padding(.horizontal)
            .frame(width: 285, height: 400)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .cornerRadius(20)
            )
        }
    }
}

#Preview {
    RegisterView(authVM: AuthViewModel())
}
