//
//  ExerciseAttempt.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

struct ExerciseAttempt: Identifiable {
    let id: UUID
    let score: Float
    let player: String
    let playerEmail: String
    let technique: String
    let coachScore: Float
    let date: String
}
