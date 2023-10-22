//
//  AuthManager.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

class LoginManager: ObservableObject {
    @Published var isLoggedIn = false
    
    func login() {
        self.isLoggedIn = true
    }
    
    func logout() {
        self.isLoggedIn = false
    }
}
