//
//  CoachViewModel.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import Foundation

class CoachViewModel: ObservableObject {
    @Published var coaches: [Coach] = []
    
    init() {
        coaches = coachesData
    }
}

let coachesData = [
    Coach(id: UUID(), name: "Jurgen Klopp", email: "jurgenklopp@gmail.com", status: CoachRelation.active),
    Coach(id: UUID(), name: "Phil Jackson", email: "philjackson@hotmail.com", status: CoachRelation.active),
    Coach(id: UUID(), name: "Sir Alex Ferguson", email:"fergie@outlook.com", status: CoachRelation.pending),
]
