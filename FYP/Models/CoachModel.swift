//
//  CoachRelationModel.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import Foundation

struct Coach: Identifiable, Codable, Hashable {
    var id: UUID
    var name: String
    var email: String
}

struct UserResponse: Codable {
    var id: UUID
    var first_name: String
    var last_name: String
    var email: String
    var password: String?
    var location: String?
    var title: String?
    var description: String?
    var tags: String?
    var avatar: String?
    var language: String?
    var theme: String?
    var tfa_secret: String?
    var status: String?
    var role: UUID
    var token: String?
    var last_access: String?
    var last_page: String?
    var provider: String?
    var external_identifier: String?
    var auth_data: String?
    var email_notifications: Bool?
}
