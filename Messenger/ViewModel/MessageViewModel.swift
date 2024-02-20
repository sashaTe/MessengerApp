//
//  MessageViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 05.02.2024.
//

import SwiftUI
import FirebaseFirestore

struct MessageViewModel {
   
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else {return nil}
        return URL(string: profileImageUrl)
    }
    
    var fullname: String {
        guard let user = message.user else { return ""}
        return user.fullname
    }
    
    var time: String {
        
        return formatTransactionTimestamp(message.timestamp)
        
    }

}
