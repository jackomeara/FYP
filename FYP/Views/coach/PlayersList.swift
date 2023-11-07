//
//  PlayersList.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import SwiftUI

struct PlayersList: View {
    @ObservedObject var playersModel: PlayersViewModel = PlayersViewModel()
    @State private var requestsClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            if(playersModel.requestedPlayers.count > 0) {
                VStack {
                    Button("\(requestsClicked ? "Hide" : "Show") Requests (\(String(playersModel.requestedPlayers.count)))") {
                        requestsClicked.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    if(requestsClicked) {
                        ForEach(playersModel.requestedPlayers) { player in
                            HStack {
                                PlayerCard(player: player)
                                Spacer()
                                Button("Accept") {
                                    playersModel.acceptRequest(player: player)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.green)
                                Button("Reject") {
                                    playersModel.rejectRequest(player: player)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.red)
                            }
                            .padding(.horizontal, 15)
                        }
                        .padding(.vertical, 10)
                    }
                }
                .padding(.bottom, 10)
            }
            
            List{
                ForEach(playersModel.players) {player in
                    NavigationLink(destination: PlayerView(player: player)) {
                        PlayerCard(player: player)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Players")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    PlayersList()
}
