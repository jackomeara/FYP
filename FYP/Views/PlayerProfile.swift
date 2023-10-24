//
//  ProfileScreen.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct PlayerProfile: View {
    @ObservedObject var coachesModel: CoachViewModel = CoachViewModel()
    @ObservedObject var userModel: UserViewModel = UserViewModel()
    @ObservedObject var loginManager: LoginManager
    @State private var newCoach: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileBase(user: userModel.user, stat1: "Attempts", value1: 24, stat2: "Exercises", value2: 4)
                
                VStack {
                    Text("Coach List")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        ForEach(coachesModel.coaches) { coach in
                            HStack {
                                Text(coach.name)
                                Spacer()
                                Image(systemName: coach.status.icon)
                                    .foregroundStyle(coach.status == .active ? .green : .gray)
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 1)
                            .font(.title3)
                            
                        }
                    Text("Add Coach")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                    
                    HStack {
                        TextField(
                            "Email",
                            text: $newCoach
                        )
                        .foregroundColor(.black)
                        Button("Add") {
                            
                        }
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                    }
                    .padding(.horizontal, 40)
                }
                .padding(.top, 20)
                
                
                
                Button("Log Out") {
                    loginManager.logout()
                }
                .tint(.red)
                .padding(.top, 40)
                .buttonStyle(.borderedProminent)
                
            }
        }
    }
}

#Preview {
    PlayerProfile(loginManager: LoginManager())
}
