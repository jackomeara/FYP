//
//  PlayersViewModels.swift
//  FYP
//
//  A viewmodel for coaches to control their assigned players and requested players
//
//  Created by Jack O'Meara on 23/10/2023.
//

import Foundation

class PlayersViewModel: ObservableObject {
    @Published var players: [User] = []
    @Published var requestedPlayers: [User] = []
    
    init() {
        players = playersData
        requestedPlayers = requestedPlayersData
    }
    
    func acceptRequest(player: User) {
        players.insert(player, at: 0)
        requestedPlayers.removeAll(where: { $0 == player })
    }
    
    func rejectRequest(player: User) {
        requestedPlayers.removeAll(where: { $0 == player })
    }
}

let playersData = [
    User(id: UUID(), name: "Kobe Bryant", email: "kobebryant@gmail.com", profilePhoto: "kobe"),
    User(id: UUID(), name: "Mo Salah", email: "mosalah@gmail.com", profilePhoto: "salah"),
    User(id: UUID(), name: "Keith Earls", email: "keithearls@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Novak Djokovic", email: "novakdjokovic@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Eliud Kipchoge", email: "eliudkipchoge@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Ernie Els", email: "@ernieelsgmail.com", profilePhoto: "els"),
]

let requestedPlayersData = [
    User(id: UUID(), name: "Tiger Woods", email: "tigerwoods@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Jared Dudley", email: "jareddudley@gmail.com", profilePhoto: "jared_dudley"),
    User(id: UUID(), name: "Leandro Barbosa", email: "leandrobarbosa@gmail.com", profilePhoto: "barbosa"),
]
