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
            if(loginManager.role == "player"){
                TabView {
                    ExerciseAttemptsList()
                        .tabItem {
                            Label("Attempts", systemImage: "figure.cooldown")
                        }
                    ExerciseList()
                        .tabItem {
                            Label("Record", systemImage: "camera")
                        }
                    PlayerProfile(loginManager: loginManager)
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
                }
            }
            else {
                TabView {
                    CoachAttemptsList()
                        .tabItem {
                            Label("Activity", systemImage: "figure.cooldown")
                        }
                    PlayersList()
                        .tabItem {
                            Label("Players", systemImage: "person.2.fill")
                        }
                    GroupsList()
                        .tabItem {
                            Label("Groups", systemImage: "person.3.fill")
                        }
                    CoachProfile(loginManager: loginManager)
                        .tabItem {
                            Label("Profile", systemImage: "person.fill")
                        }
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
