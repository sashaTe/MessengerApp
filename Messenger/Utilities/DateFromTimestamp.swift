//
//  DateFromTimestamp.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 15.02.2024.
//

import Foundation
import FirebaseFirestore

func formatTransactionTimestamp(_ timestamp: Timestamp?) -> String {
    if let timestamp = timestamp {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let date = timestamp.dateValue()
        dateFormatter.locale = Locale.current
        let formatted = dateFormatter.string(from: date)
        return formatted
    }
    return ""
}
