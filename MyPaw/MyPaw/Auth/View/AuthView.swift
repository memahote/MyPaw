//
//  AuthView.swift
//  MyPaw
//
//  Created by Mounir Emahoten on 13/11/2025.
//

import SwiftUI

struct AuthView: View {
    @Bindable var authVM: AuthViewModel
    var body: some View {
        ZStack {
            if !authVM.showLoginView {
                RegisterView(authVM: authVM)
                    .transition(.move(edge: .trailing))
            } else {
                LoginView(authVM: authVM)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#Preview {
    AuthView(authVM: AuthViewModel())
}

