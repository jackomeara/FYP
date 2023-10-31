//
//  GroupViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import Foundation

class GroupViewModel: ObservableObject {
    @Published var groups: [Group]
    
    init() {
        groups = groupData
    }
}

let groupData = [
    Group(id: UUID(), 
          name: "Basketball",
          players: [
            User(id: UUID(), name: "Leandro Barbosa", email: "leandrobarbosa", profilePhoto: "barbosa"),
            User(id: UUID(), name: "Kobe Bryant", email: "kobebryant", profilePhoto: "kobe"),
            User(id: UUID(), name: "Jared Dudley", email: "jared_dudley", profilePhoto: "jared_dudley")
          ],
          coachID: UUID()),
    Group(id: UUID(),
          name: "Golf",
          players: [
            User(id: UUID(), name: "Tiger Woods", email: "tw", profilePhoto: ""),
            User(id: UUID(), name: "Ernie Els", email: "ee", profilePhoto: "els"),
            User(id: UUID(), name: "Rory McIlroy", email: "rm", profilePhoto: "")
          ],
          coachID: UUID())
]
