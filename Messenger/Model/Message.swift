//
//  Message.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import Foundation

struct Message: Identifiable {
    let id = UUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
    
}
