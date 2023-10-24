//
//  CoachRelationModel.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import Foundation

struct Coach: Identifiable {
    var id: UUID
    var name: String
    var email: String
    var status: CoachRelation
}

enum CoachRelation {
    case active
    case pending
    case rejected
}

extension CoachRelation {
    var icon: String {
        switch self {
        case .active: return "checkmark.circle.fill"
        case .pending: return "clock.circle.fill"
        case .rejected: return "xmark.circle.fill"
        }
    }
}
