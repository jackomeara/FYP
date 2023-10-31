//
//  PlayerView.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import SwiftUI

struct PlayerView: View {
    var player: User
    @ObservedObject var attemptModel = ExerciseAttemptViewModel()
    
    var body: some View {
        NavigationStack {
            List{
                NavigationLink(destination: PlayerEnabledExercises()) {
                    Text("Edit Exercises")
                        .font(.title3)
                }
                ForEach(attemptModel.attempts) {attempt in
                    NavigationLink(destination: AttemptView(attempt: attempt)) {
                        AttemptCard(attempt: attempt)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle(player.name)
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    PlayerView(player: User(id: UUID(), name: "Kobe Bryant", email: "kobe", profilePhoto: "kobe"))
}
