//
//  Message.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
}
