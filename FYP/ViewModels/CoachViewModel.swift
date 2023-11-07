//
//  CoachViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import Foundation

class CoachViewModel: ObservableObject {
    @Published var coaches: [Coach] = []
    private var relationshipModel: PlayerCoachRelationshipViewModel = PlayerCoachRelationshipViewModel()
    @Published var error: Error? = nil
    
    init() {
        processRequestData()
    }
    
    struct RequestWrapper: Codable {
        var data: [UserResponse]
    }
    
    func fetchData(completion: @escaping (Result<[UserResponse], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://localhost:8055/users?filter[role][_eq]=b4d51e8a-cb89-4363-9d36-6dc37b2bf2da")!) {data, response, error in
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
                let processedArray: [Coach] = response.map { responseObj in
                    let processedObj = Coach(
                        id: responseObj.id,
                        name: responseObj.first_name + " " + responseObj.last_name,
                        email: responseObj.email
                    )
                    return processedObj
                }
                self.coaches = processedArray
            case .failure (let error):
                self.error = error
                print(error)
            }
        }
    }
    
    func getCoachByEmail(email: String) -> Coach{
        if let coach = self.coaches.first(where: { $0.email == email }) {
            return coach
        } else {
            print("No coach found")
        }
        return Coach(id: UUID(), name: "Error", email: "error@error.com")
    }
}

let coachesData = [
    Coach(id: UUID(), name: "Jurgen Klopp", email: "jurgenklopp@gmail.com"),
    Coach(id: UUID(), name: "Phil Jackson", email: "philjackson@hotmail.com"),
    Coach(id: UUID(), name: "Sir Alex Ferguson", email:"fergie@outlook.com"),
]
