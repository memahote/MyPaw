//
//  LoginView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 12/11/2025.
//

import SwiftUI

struct LoginView: View {
    @Bindable var authVM: AuthViewModel
    var body: some View {
        ZStack{
            Image("BackgroundProfil")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                Text("Me connecter")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundStyle(.whiteDirt)
                    .padding()
                
                TextField("Nom d'utilisateur", text: $authVM.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Mot de passe", text: $authVM.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if authVM.isLoading {
                    ProgressView()
                } else {
                    
                    if let error = authVM.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                    }
                    
                    HStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Mot de passe oublié")
                                .foregroundStyle(.orangeMid)
                        }
                        
                    }
                    
                    NextButton(text: "C'est Parti !") {
                        Task {
                            await authVM.login()
                        }
                        authVM.isLoggedIn = true
                    }
                    
                }
                
                
                Button {
                    authVM.showLoginView = false
                } label: {
                    Text("Créer un compte")
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
    LoginView(authVM: AuthViewModel())
}
