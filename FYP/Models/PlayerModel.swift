//
//  PlayerModel.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

struct Player: Identifiable {
    let id: UUID
    let name: String
    let email: String
    let coachCode: Int
}
