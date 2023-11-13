//
//  GroupRequests.swift
//  FYP
//
//  Created by Jack O'Meara on 13/11/2023.
//

import Foundation
import SwiftUI

// get all groups that a coach is responsible for. asynchronous method that returns an array of Group on successful request.
func getCoachGroups(coachEmail: String, completion: @escaping (Result<[Group], Error>) -> Void) {
    @EnvironmentObject var settings: AppSettings
    struct RequestWrapper: Codable {
        var data: [GroupResponse]
    }
    
    URLSession.shared.dataTask(with: URL(string: "\(settings.url)/items/group")!) {data, response, error in
        DispatchQueue.main.async {
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(RequestWrapper.self, from: data)
                    let response = decodedData.data
                    var groupList: [Group] = []
                    for group in response {
                        var playerList: [Player] = []
                        for player in group.players {
                            let playerObj: Player = Player(id: UUID(), name: player.playerName, email: player.playerEmail)
                            playerList.append(playerObj)
                        }
                        let groupObj = Group(id: UUID(), name: group.name, players: playerList, coachID: UUID())
                        groupList.append(groupObj)
                    }
                    completion(.success(groupList))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }.resume()
}
