//
//  ExerciseAttemptViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

class ExerciseAttemptViewModel: ObservableObject {
    @Published var attempts: [ExerciseAttempt] = []
    
    init() {
        attempts = attemptsData
    }
}

let attemptsData = [
    ExerciseAttempt(id: UUID(), score: 7.1, player: "Jack O'M", technique: "Back Squat", coachScore: 6.4, date: "3 days ago"),
    ExerciseAttempt(id: UUID(), score: 8.9, player: "Jack O'M", technique: "Front Squat", coachScore: 9.1, date: "4 days ago"),
    ExerciseAttempt(id: UUID(), score: 6.4, player: "Jack O'M", technique: "Push Up", coachScore: 7.0, date: "2 weeks ago"),
    ExerciseAttempt(id: UUID(), score: 7.1, player: "Jack O'M", technique: "Back Squat", coachScore: 6.4, date: "3 days ago"),
    ExerciseAttempt(id: UUID(), score: 8.9, player: "Jack O'M", technique: "Front Squat", coachScore: 9.1, date: "4 days ago"),
    ExerciseAttempt(id: UUID(), score: 6.4, player: "Jack O'M", technique: "Push Up", coachScore: 7.0, date: "2 weeks ago"),
    ExerciseAttempt(id: UUID(), score: 7.1, player: "Jack O'M", technique: "Back Squat", coachScore: 6.4, date: "3 days ago"),
    ExerciseAttempt(id: UUID(), score: 8.9, player: "Jack O'M", technique: "Front Squat", coachScore: 9.1, date: "4 days ago"),
    ExerciseAttempt(id: UUID(), score: 6.4, player: "Jack O'M", technique: "Push Up", coachScore: 7.0, date: "2 weeks ago"),
    ExerciseAttempt(id: UUID(), score: 7.1, player: "Jack O'M", technique: "Back Squat", coachScore: 6.4, date: "3 days ago"),
    ExerciseAttempt(id: UUID(), score: 8.9, player: "Jack O'M", technique: "Front Squat", coachScore: 9.1, date: "4 days ago"),
    ExerciseAttempt(id: UUID(), score: 6.4, player: "Jack O'M", technique: "Push Up", coachScore: 7.0, date: "2 weeks ago"),
    ExerciseAttempt(id: UUID(), score: 7.1, player: "Jack O'M", technique: "Back Squat", coachScore: 6.4, date: "3 days ago"),
    ExerciseAttempt(id: UUID(), score: 8.9, player: "Jack O'M", technique: "Front Squat", coachScore: 9.1, date: "4 days ago"),
    ExerciseAttempt(id: UUID(), score: 6.4, player: "Jack O'M", technique: "Push Up", coachScore: 7.0, date: "2 weeks ago"),
    ExerciseAttempt(id: UUID(), score: 7.1, player: "Jack O'M", technique: "Back Squat", coachScore: 6.4, date: "3 days ago"),
    ExerciseAttempt(id: UUID(), score: 8.9, player: "Jack O'M", technique: "Front Squat", coachScore: 9.1, date: "4 days ago"),
    ExerciseAttempt(id: UUID(), score: 6.4, player: "Jack O'M", technique: "Push Up", coachScore: 7.0, date: "2 weeks ago")
]
