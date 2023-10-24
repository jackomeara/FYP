//
//  ProfileViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User
    
    init() {
        user = userData
    }
}

let userData = User(id: UUID(), name: "Jack O'Meara", email: "jedomeara@gmail.com", profilePhoto: "none")
