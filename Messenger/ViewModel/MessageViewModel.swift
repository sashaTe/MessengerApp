//
//  MessageViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 05.02.2024.
//

import SwiftUI

class MessageViewModel: ObservableObject {
    @Published var user: User?
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
    
    var chatPartnerId: String {
        return message.fromId == currentUid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    var fullname: String {
        guard let user = user else { return ""}
        return user.fullname
    }
    
    func fetchUser() {
        collectionUsers.document(chatPartnerId).getDocument { snapshot, _ in
            self.user = try? snapshot?.data(as: User.self)
            
        }
    }
}
