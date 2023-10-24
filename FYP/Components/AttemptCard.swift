//
//  AttemptCard.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct AttemptCard: View {
    var attempt: ExerciseAttempt
    var image = "back_squat"
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 60)
                .clipped()
            VStack(alignment: .leading) {
                Text(attempt.technique)
                    .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(attempt.player)
                .font(.system(size: 12))
                Text(String(attempt.date))
                    .font(.system(size: 12))
                    
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "desktopcomputer")
                    Text("\(String(attempt.score))")
                }.font(.subheadline)
                HStack {
                    Image(systemName: "person.fill")
                    Text("\(String(attempt.coachScore))")
                }.font(.subheadline)
            }
            .padding()
            .font(.headline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AttemptCard(attempt: ExerciseAttempt(id: UUID(), score: 7.6, player: "Jack O'Meara", playerEmail: "jedomeara@gmail.com", technique: "Back Squat", coachScore: 7.4, date: "1 week ago"))
}
