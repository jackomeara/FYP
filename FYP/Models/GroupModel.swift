//
//  GroupModel.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import Foundation

struct Group: Identifiable {
    let id: UUID
    let name: String
    let players: [User]
    let coachID: UUID
}
