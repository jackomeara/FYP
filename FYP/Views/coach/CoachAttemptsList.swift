//
//  CoachAttemptsList.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import SwiftUI

struct CoachAttemptsList: View {
    @ObservedObject var attemptModel = ExerciseAttemptViewModel()
    @State private var showReviewableAttemptsOnly: Bool = false
    
    func getFilteredAttempts() -> [ExerciseAttempt] {
        var attempts: [ExerciseAttempt]
        if showReviewableAttemptsOnly {
            attempts = attemptModel.getReviewableAttempts()
        } else {
            attempts = attemptModel.getAllAttempts()
        }
        return attempts
    }
    
    var body: some View {
        NavigationStack {
            List{
                Toggle(isOn: $showReviewableAttemptsOnly) {
                    Text("Reviewable Attempts Only")
                }
                ForEach(getFilteredAttempts()) {attempt in
                    NavigationLink(destination: AttemptView(attempt: attempt)) {
                        AttemptCard(attempt: attempt)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Attempts")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    CoachAttemptsList()
}
