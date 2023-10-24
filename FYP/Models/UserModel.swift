//
//  PlayerModel.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

struct User: Identifiable, Equatable {
    let id: UUID
    let name: String
    let email: String
    let profilePhoto: String
}
