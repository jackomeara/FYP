//
//  AppSettings.swift
//  FYP
//
//  Created by Jack O'Meara on 13/11/2023.
//

import Foundation

class AppSettings: ObservableObject {
    @Published var url: String = "http://192.168.1.30:8055"
}
