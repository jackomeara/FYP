//
//  AttemptCard.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct AttemptCard: View {
    var attempt: ExerciseAttempt
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(attempt.technique)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(String(attempt.date))
                    .font(.subheadline)
                    
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "desktopcomputer")
                    Text(": \(String(attempt.score))")
                }
                HStack {
                    Image(systemName: "person.fill")
                    Text(": \(String(attempt.coachScore))")
                }
            }
            .padding()
            .font(.headline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AttemptCard(attempt: ExerciseAttempt(id: UUID(), score: 7.6, player: "Jack O'Meara", technique: "Back Squat", coachScore: 7.4, date: "1 week ago"))
}
