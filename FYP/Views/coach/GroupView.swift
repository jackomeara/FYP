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
            if(showPlayers) {
                NavigationStack {
                    Button(showPlayers ? "View Attempts" : "View Players") {
                        showPlayers = !showPlayers
                    }
                    List {
                        ForEach(group.players){ player in
                            NavigationLink(destination: PlayerView(player: player)){
                                Text(player.name)
                            }
                        }
                    }
                    .navigationTitle("Players")
                    .listStyle(PlainListStyle())
                    .toolbar {
                        Button {
                            
                        } label: {
                            Image(systemName: "trash.fill")
                                .foregroundStyle(.red)
                        }
                    }
                }
            } else {
                Button(showPlayers ? "View Attempts" : "View Players") {
                    showPlayers = !showPlayers
                }
                    CoachAttemptsList()
                }
        }
    }
}

#Preview {
    GroupView(group: Group(id: UUID(),
                               name: "Golf",
                               players: [
                                 Player(id: UUID(), name: "Tiger Woods", email: "tw", profilePhoto: ""),
                                 Player(id: UUID(), name: "Ernie Els", email: "ee", profilePhoto: "els"),
                                 Player(id: UUID(), name: "Rory McIlroy", email: "rm", profilePhoto: "")
                               ],
                               coachID: UUID()))
}
