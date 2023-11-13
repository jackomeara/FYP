//
//  GroupViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import Foundation

class GroupViewModel: ObservableObject {
    @Published var groups: [Group] = []
    @Published var error: Error?
    
    struct RequestWrapper: Codable {
        var data: [GroupResponse]
    }
    
    init() {
        processRequestData()
    }
    
    func fetchData(completion: @escaping (Result<[GroupResponse], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://192.168.1.30:8055/items/group")!) {data, response, error in
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
                var groupList: [Group] = []
                for group in response {
                    var playerList: [Player] = []
                    for player in group.players {
                        let playerObj: Player = Player(id: UUID(), name: player.playerName, email: player.playerEmail)
                        playerList.append(playerObj)
                    }
                    let groupObj = Group(id: UUID(), name: group.name, players: playerList, coachID: UUID())
                    groupList.append(groupObj)
                    self.groups = groupList
                }
                
            case .failure (let error):
                self.error = error
                print(error)
            }
        }
    }
    
    private func createNewGroupRequest(groupJSON: Data, completion: @escaping (Result<Bool, Error>) -> Void) {
        var request = URLRequest(url: URL(string:"http://192.168.1.30:8055/items/group")!)
        request.httpMethod = "POST"
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpBody = groupJSON
        URLSession.shared.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        print(data)
                        completion(.success(true))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func createNewGroup(group: Data) {
        createNewGroupRequest(groupJSON: group) { status in
            print("creating group request")
        }
    }
}

let groupData = [
    Group(id: UUID(), 
          name: "Basketball",
          players: [
            Player(id: UUID(), name: "Leandro Barbosa", email: "leandrobarbosa", profilePhoto: "barbosa"),
            Player(id: UUID(), name: "Kobe Bryant", email: "kobebryant", profilePhoto: "kobe"),
            Player(id: UUID(), name: "Jared Dudley", email: "jared_dudley", profilePhoto: "jared_dudley")
          ],
          coachID: UUID()),
    Group(id: UUID(),
          name: "Golf",
          players: [
            Player(id: UUID(), name: "Tiger Woods", email: "tw", profilePhoto: ""),
            Player(id: UUID(), name: "Ernie Els", email: "ee", profilePhoto: "els"),
            Player(id: UUID(), name: "Rory McIlroy", email: "rm", profilePhoto: "")
          ],
          coachID: UUID())
]
