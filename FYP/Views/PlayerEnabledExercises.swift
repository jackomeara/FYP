//
//  PlayerEnabledExercises.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import SwiftUI

struct PlayerEnabledExercises: View {
    @ObservedObject var exerciseModel = ExerciseViewModel()
    @State private var permissions: [Bool] = [false, true, true, false, false, false, false ]
    var body: some View {
        List{
            ForEach(Array(exerciseModel.exercises.enumerated()), id: \.element) {index, exercise in
                Toggle(isOn: $permissions[index]) {
                    Text(exercise.name)
                }
            }
        }
    }
}

#Preview {
    PlayerEnabledExercises()
}
