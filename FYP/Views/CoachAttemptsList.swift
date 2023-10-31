//
//  CoachAttemptsList.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import SwiftUI

struct CoachAttemptsList: View {
    @ObservedObject var attemptModel = ExerciseAttemptViewModel()
    @State private var showUserAttemptsOnly: Bool = false
    
    
    var body: some View {
        NavigationStack {
            List{
                Toggle(isOn: $showUserAttemptsOnly) {
                    Text("My Attempts Only")
                }
                ForEach(attemptModel.attempts) {attempt in
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
