//
//  ExerciseAttempt.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

struct ExerciseAttempt: Identifiable, Hashable, Codable {
    let id: UUID
    let score: Float?
    let player: String
    let playerEmail: String
    let technique: String
    let coachScore: Float?
    let date: String
    let techniqueID: String
    let playerID: String
    let aiFeedbackID: UUID?
    let coachFeedbackID: UUID?
    
    enum CodingKeys: String, CodingKey {
        case id
        case player = "playerName"
        case playerEmail
        case technique
        case coachScore
        case date = "date_created"
        case score = "aiScore"
        case techniqueID
        case playerID
        case aiFeedbackID
        case coachFeedbackID
    }
}

struct ExerciseAttemptResponse: Identifiable, Hashable, Codable {
    let id: UUID
    let technique: String
    let techniqueID: String
    let playerName: String
    let playerEmail: String
    let playerID: String
    let date_created: String
    let aiFeedbackID: UUID?
    let coachFeedbackID: UUID?
    let aiScore: Float?
    let coachScore: Float?
}
