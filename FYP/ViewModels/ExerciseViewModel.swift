//
//  ExerciseViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 21/10/2023.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    
    init() {
        exercises = exercisesData
    }
}

let exercisesData = [
    Exercise(id: UUID(), name: "Back Squat", description: "Back squat with barbell", video: "https://videolink.com"),
    Exercise(id: UUID(), name: "Front Squat", description: "Front squat with barbell", video: "https://videolink.com"),
    Exercise(id: UUID(), name: "Push Up", description: "Push up with full range and tucked-in elbows", video: "https://videolink.com"),
    Exercise(id: UUID(), name: "Deadlift", description: "Deadlift with barbell", video: "https://videolink.com"),
    Exercise(id: UUID(), name: "Pull Up", description: "Pull up with bar, palms facing away", video: "https://videolink.com"),
    Exercise(id: UUID(), name: "Plank", description: "Plank with straight back resting on forearms", video: "https://videolink.com"),
    Exercise(id: UUID(), name: "Shoulder Press", description: "Shoulder press with barbell", video: "https://videolink.com")
]
