//
//  ExerciseView.swift
//  FYP
//
//  Created by Jack O'Meara on 21/10/2023.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    var exercise: Exercise
    let avPlayer = AVPlayer(url: Bundle.main.url(forResource: "back_squat", withExtension: "mp4")!)
    
    var body: some View {
        VStack {
            Text(exercise.name)
                .font(.title)
                .padding(.top, 50)
            VideoPlayer(player: avPlayer)
                .onDisappear{
                    avPlayer.isMuted = false
                }
                .frame(height: 300)
            Text(exercise.description)
                .font(.headline)
                .foregroundStyle(Color.gray)
                .padding(.top, 30)
            
            Spacer()
            
            HStack {
                Button("Record Video") {
                    
                }
                .buttonStyle(.borderedProminent)
                Button("Upload Video") {
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.bottom, 50)
            
        }
    }
}

#Preview {
    ExerciseView(exercise: Exercise(id: UUID(), name: "Back Squat", description: "Back squat with a barbell, make sure to hit below parallel", video: "back_squat"))
}
