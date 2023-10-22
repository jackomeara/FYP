//
//  ExerciseList.swift
//  FYP
//
//  Created by Jack O'Meara on 21/10/2023.
//

import SwiftUI

struct ExerciseList: View {
    @ObservedObject var exerciseModel = ExerciseViewModel()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(exerciseModel.exercises) {exercise in
                    NavigationLink(destination:
                                    ExerciseView(exercise: exercise)) {
                        Text(exercise.name)
                    }
                }
            }
            .navigationTitle("Exercises")
        }
    }
}

#Preview {
    ExerciseList()
}
