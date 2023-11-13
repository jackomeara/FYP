//
//  ExerciseViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 21/10/2023.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var error: Error?
    
    private struct RequestWrapper: Codable {
        var data: [ExerciseResponse]
    }
    
    init() {
        processRequestData()
    }
    
    func fetchData(completion: @escaping (Result<[ExerciseResponse], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "http://192.168.1.30:8055/items/technique")!) {data, response, error in
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
                    let processedArray = try JSONDecoder().decode([Exercise].self, from: reqJSON)
                    self.exercises = processedArray
                } catch {
                    self.error = error
                }
            case .failure(let error):
                self.error = error
            }
        }
    }
}
