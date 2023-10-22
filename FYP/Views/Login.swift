//
//  Login.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct Login: View {
    @ObservedObject var loginManager: LoginManager
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
//            SplashHeader()
            TextField(
                "Email",
                text: $email
            )
            .padding(.horizontal, 30)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            
            SecureField(
                "Password",
                text: $password
            )
            .padding(.horizontal, 30)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            
            Button("Log In") {
                loginManager.login()
            }
            .buttonStyle(.borderedProminent)
            
            
            Text("Don't have an account?")
                .font(.headline)
                .fontWeight(.medium)
            NavigationLink(
                destination: ProfileScreen(loginManager: loginManager),
                label: {
                    Text("Sign Up")
                        .foregroundStyle(.blue)
                })
        }
    }
}

#Preview {
    Login(loginManager: LoginManager())
}
