//
//  formatDate.swift
//  FYP
//
//  Created by Jack O'Meara on 06/11/2023.
//

import Foundation

func formattedDate(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    dateFormatter.locale = Locale(identifier: "en_IE_POSIX")
    
    if let resultDate = dateFormatter.date(from: date) {
        dateFormatter.dateFormat = "HH:mm - dd/MM/yy"
        return dateFormatter.string(from: resultDate)
    } else {
        return "Invalid Date"
    }
}
