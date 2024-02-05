//
//  MessageViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 05.02.2024.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
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

}
