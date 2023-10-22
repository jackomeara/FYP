//
//  ProfileScreen.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var playerModel: PlayerViewModel = PlayerViewModel()
    @ObservedObject var loginManager: LoginManager
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width:140, height:140)
                    .padding(.top, 100)
                    .padding(.bottom, 20)
                
                
                Text(playerModel.player.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(playerModel.player.email)
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                
                
                Button("Log Out") {
                    loginManager.logout()
                }
                .padding(.top, 40)
                .buttonStyle(.borderedProminent)
                
            }
        }
    }
}

#Preview {
    ProfileScreen(loginManager: LoginManager())
}
