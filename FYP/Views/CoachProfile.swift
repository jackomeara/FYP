//
//  CoachProfile.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import SwiftUI

struct CoachProfile: View {
    @ObservedObject var userModel: UserViewModel = UserViewModel()
    @ObservedObject var loginManager: LoginManager
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileBase(user: userModel.user, stat1: "Players", value1: 31, stat2: "To Review", value2: 2)
            }
            
            Button("Log Out") {
                loginManager.logout()
            }
            .tint(.red)
            .padding(.top, 40)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    CoachProfile(loginManager: LoginManager())
}
