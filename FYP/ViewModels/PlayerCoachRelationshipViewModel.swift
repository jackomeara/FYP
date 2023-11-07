//
//  PlayerCoachRelationshipViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 07/11/2023.
//

import Foundation

class PlayerCoachRelationshipViewModel: ObservableObject {
    @Published var relationships: [PlayerCoachRelationship] = []
    @Published var error: Error?
    
    struct RequestWrapper: Codable {
        var data: [PlayerCoachRelationship]
    }
    
    init() {
        processRequestData()
    }
    
    func fetchData(completion: @escaping (Result<[PlayerCoachRelationship], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://localhost:8055/items/coachRelationship")!) {data, response, error in
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
    
    func processRequestData() {
        fetchData { result in
            switch result {
            case .success(let response):
                do {
                    let reqJSON = try JSONEncoder().encode(response)
                    let processedArray = try JSONDecoder().decode([PlayerCoachRelationship].self, from: reqJSON)
                    self.relationships = processedArray
                } catch {
                    self.error = error
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
}
