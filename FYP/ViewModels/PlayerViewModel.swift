//
//  ProfileViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

class PlayerViewModel: ObservableObject {
    @Published var player: Player
    
    init() {
        player = playerData
    }
}

let playerData = Player(id: UUID(), name: "Jack O'Meara", email: "jedomeara@gmail.com", coachCode: 1635)
