//
//  ExerciseAttemptsList.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct ExerciseAttemptsList: View {
    @ObservedObject var attemptModel = ExerciseAttemptViewModel()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(attemptModel.attempts) {attempt in
                    NavigationLink(destination: AttemptView(attempt: attempt)) {
                        AttemptCard(attempt: attempt)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Attempts")
        }
    }
}

#Preview {
    ExerciseAttemptsList()
}
