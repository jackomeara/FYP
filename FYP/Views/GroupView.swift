//
//  GroupView.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import SwiftUI

struct GroupView: View {
    var group: Group
    @State var showPlayers: Bool = true
    var body: some View {
        VStack {
            Button(showPlayers ? "View Attempts" : "View Players") {
                showPlayers = !showPlayers
            }
            List {
                if(showPlayers) {
                    Text("Players")
                        .font(.title)
                    ForEach(group.players){ player in
                        NavigationLink(destination: PlayerView(player: player)){
                            Text(player.name)
                        }
                    }
                } else {
                    ExerciseAttemptsList()
                }
            }
        }
    }
}

#Preview {
    GroupView(group: Group(id: UUID(),
                               name: "Golf",
                               players: [
                                 User(id: UUID(), name: "Tiger Woods", email: "tw", profilePhoto: ""),
                                 User(id: UUID(), name: "Ernie Els", email: "ee", profilePhoto: "els"),
                                 User(id: UUID(), name: "Rory McIlroy", email: "rm", profilePhoto: "")
                               ],
                               coachID: UUID()))
}
