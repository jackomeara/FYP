//
//  ExerciseModel.swift
//  FYP
//
//  Created by Jack O'Meara on 21/10/2023.
//

import Foundation

struct Exercise: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let video: String
}
