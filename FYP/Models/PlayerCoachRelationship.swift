//
//  PlayerCoachRelationship.swift
//  FYP
//
//  Created by Jack O'Meara on 07/11/2023.
//

import Foundation

struct PlayerCoachRelationship: Codable, Hashable {
    var playerName: String
    var playerID: UUID
    var coachName: String
    var coachID: UUID
    var coachEmail: String
    var accepted: Bool
}
