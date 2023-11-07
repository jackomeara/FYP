//
//  ExerciseModel.swift
//  FYP
//
//  Created by Jack O'Meara on 21/10/2023.
//

import Foundation

struct Exercise: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let description: String
    let video: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case description = "description"
        case video = "videoURL"
    }
}

struct ExerciseResponse: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let description: String
    let videoURL: String
}
