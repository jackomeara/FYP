//
//  ContentView.swift
//  FYP
//
//  Created by Jack O'Meara on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loginManager = LoginManager()
    
    var body: some View {
        if(loginManager.isLoggedIn) {
            TabView {
                ExerciseAttemptsList()
                    .tabItem {
                        Label("Attempts", systemImage: "figure.cooldown")
                    }
                ExerciseList()
                    .tabItem {
                        Label("Record", systemImage: "camera")
                    }
                ProfileScreen(loginManager: loginManager)
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        } else {
            Login(loginManager: loginManager)
        }
    }
}

#Preview {
    ContentView()
}
