//
//  PlayersViewModels.swift
//  FYP
//
//  A viewmodel for coaches to control their assigned players and requested players
//
//  Created by Jack O'Meara on 23/10/2023.
//

import Foundation

class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = []
    @Published var requestedPlayers: [Player] = []
    @Published var error: Error?
    
    struct RequestWrapper: Codable {
        var data: [UserResponse]
    }
    
    init() {
        processRequestData()
    }
    
    func fetchData(completion: @escaping (Result<[UserResponse], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://localhost:8055/users?filter[role][_eq]=8afd8746-1d8d-4eee-96dc-ecd5840f6df5")!) {data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(RequestWrapper.self, from: data)
                        let responseData = decodedData.data
                        completion(.success(responseData))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    // process directus request into array of attempt model
    func processRequestData() {
        fetchData { result in
            switch result {
            case .success(let response):
                let processedArray: [Player] = response.map { responseObj in
                    let processedObj = Player(
                        id: responseObj.id,
                        name: responseObj.first_name + " " + responseObj.last_name,
                        email: responseObj.email
                    )
                    return processedObj
                }
                self.players = processedArray
            case .failure (let error):
                self.error = error
            }
        }
    }
    
    func acceptRequest(player: Player) {
        players.insert(player, at: 0)
        requestedPlayers.removeAll(where: { $0 == player })
    }
    
    func rejectRequest(player: Player) {
        requestedPlayers.removeAll(where: { $0 == player })
    }
}

let playersData = [
    User(id: UUID(), name: "Kobe Bryant", email: "kobebryant@gmail.com", profilePhoto: "kobe"),
    User(id: UUID(), name: "Mo Salah", email: "mosalah@gmail.com", profilePhoto: "salah"),
    User(id: UUID(), name: "Keith Earls", email: "keithearls@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Novak Djokovic", email: "novakdjokovic@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Eliud Kipchoge", email: "eliudkipchoge@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Ernie Els", email: "@ernieelsgmail.com", profilePhoto: "els"),
]

let requestedPlayersData = [
    User(id: UUID(), name: "Tiger Woods", email: "tigerwoods@gmail.com", profilePhoto: "none"),
    User(id: UUID(), name: "Jared Dudley", email: "jareddudley@gmail.com", profilePhoto: "jared_dudley"),
    User(id: UUID(), name: "Leandro Barbosa", email: "leandrobarbosa@gmail.com", profilePhoto: "barbosa"),
]
