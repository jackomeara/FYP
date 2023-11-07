//
//  PlayerCard.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import SwiftUI

struct PlayerCard: View {
    @State var player: Player
    var body: some View {
        HStack {
            if(player.profilePhoto == "none") {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.green)
                    .frame(width:50, height:50)
            } else {
                Image(player.profilePhoto)
                    .resizable()
                    .scaledToFill()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.green)
                    .frame(width:50, height:50)
            }
            Text(player.name)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    PlayerCard(player: Player(id: UUID(), name: "Jack O'Meara", email: "jedomeara@gmail.com", profilePhoto: "none"))
}

#Preview("Kobe") {
    PlayerCard(player: Player(id: UUID(), name: "Kobe Bryant", email: "kobe@gmail.com", profilePhoto: "kobe"))
}

#Preview("Jared Dudley") {
    PlayerCard(player: Player(id: UUID(), name: "Jared Dudley", email: "jareddudley@gmail.com", profilePhoto: "jared_dudley"))
}
