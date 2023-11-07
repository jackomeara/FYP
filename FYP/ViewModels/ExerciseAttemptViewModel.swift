//
//  ExerciseAttemptViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import Foundation

class ExerciseAttemptViewModel: ObservableObject {
    @Published private var attempts: [ExerciseAttempt] = []
    @Published var error: Error?

    
    private struct AttemptRequestWrapper: Codable {
        var data: [ExerciseAttemptResponse]
    }
    
    init() {
        processRequestData()
    }
    
    // get all attempts from directus and save as array of attempt response model
    func fetchData(completion: @escaping (Result<[ExerciseAttemptResponse], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: "http://localhost:8055/items/attempt")!) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(AttemptRequestWrapper.self, from: data )
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
                let processedArray: [ExerciseAttempt] = response.map { responseObj in
                    let processedObj = ExerciseAttempt(
                        id: responseObj.id,
                        score: responseObj.aiScore,
                        player: responseObj.playerName,
                        playerEmail: responseObj.playerEmail,
                        technique: responseObj.technique,
                        coachScore: responseObj.coachScore,
                        date: formattedDate(date: responseObj.date_created),
                        techniqueID: responseObj.techniqueID,
                        playerID: responseObj.playerID,
                        aiFeedbackID: responseObj.aiFeedbackID,
                        coachFeedbackID: responseObj.coachFeedbackID
                    )
                    return processedObj
                }
                self.attempts = processedArray
            case .failure (let error):
                self.error = error
            }
        }
    }
    
    // get all attempts for a user (by userID)
    func getAttemptsByUser(playerID: String) -> [ExerciseAttempt] {
        let filteredAttempts = self.attempts.filter { $0.playerID == playerID }
        return filteredAttempts
    }
    
    // get attempts needing to be reviewed
    // TODO: add coachID parameter
    func getReviewableAttempts() -> [ExerciseAttempt] {
        let filteredAttempts = self.attempts.filter { $0.coachFeedbackID == nil && $0.coachScore == nil }
        return filteredAttempts
    }
    
    func getAllAttempts() -> [ExerciseAttempt] {
        return self.attempts
    }
}
