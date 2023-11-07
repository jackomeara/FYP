//
//  GroupModel.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import Foundation

struct Group: Identifiable, Codable {
    let id: UUID
    let name: String
    let players: [Player]
    let coachID: UUID
}

struct GroupResponse: Codable, Identifiable {
    let id: UUID
    let name: String
    let coachEmail: String
    let coachID: String
    let coachName: String
    let players: [GroupPlayer]
}

struct GroupPlayer: Codable {
    let playerID: String
    let playerName: String
    let playerEmail: String
}
