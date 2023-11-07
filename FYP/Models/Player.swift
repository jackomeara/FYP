//
//  Player.swift
//  FYP
//
//  Created by Jack O'Meara on 07/11/2023.
//

import Foundation

struct Player: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var email: String
    var profilePhoto: String = "none"
}
