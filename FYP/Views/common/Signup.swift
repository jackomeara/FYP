//
//  Signup.swift
//  FYP
//
//  Created by Jack O'Meara on 22/10/2023.
//

import SwiftUI

struct Signup: View {
    @ObservedObject var loginManager: LoginManager
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    
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
            
            TextField(
                "Name",
                text: $name
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
            
            Button("Sign Up") {
                loginManager.makeCoach()
                loginManager.login()
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
}

#Preview {
    Signup(loginManager: LoginManager())
}
