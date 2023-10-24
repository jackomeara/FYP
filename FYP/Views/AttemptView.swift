//
//  AttemptView.swift
//  FYP
//
//  Created by Jack O'Meara on 22/10/2023.
//

import SwiftUI
import AVKit

struct AttemptView: View {
    var attempt: ExerciseAttempt
    let avPlayer = AVPlayer(url: Bundle.main.url(forResource: "back_squat", withExtension: "mp4")!)
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "figure.run")
                            .font(.headline)
                        Text(attempt.technique)
                            .font(.headline)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.headline)
                        Text(attempt.player)
                            .font(.headline)
                    }
                }
                .padding()
                VideoPlayer(player: avPlayer)
                    .onDisappear{
                        avPlayer.isMuted = false
                    }
                    .frame(height: 300)
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "")
                            Text("AI Score")
                                .font(.title2)
                        }
                        Text(String(attempt.score))
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.trailing, 20)
                    VStack {
                        HStack {
                            Image(systemName: "")
                            Text("Coach Score")
                                .font(.title2)
                        }
                        Text(String(attempt.coachScore))
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.leading, 20)
                }
                VStack {
                    Text("Coach comments:")
                        .padding(.top, 10)
                        .padding(.bottom, 4)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Good depth achieved. Should be careful not to lean too far forwards at the bottom of the squat. Good progress overall.")
                }
                .padding(.horizontal, 10)
                Spacer()
            }
        }
    }
}

#Preview {
    AttemptView(attempt: ExerciseAttempt(id: UUID(), score: 7.4, player: "Jack O'Meara", playerEmail:"jedomeara@gmail.com", technique: "Back Squat", coachScore: 8.2, date: "2 days ago"))
}
