//
//  ConversationCellViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 13.02.2024.
//

import SwiftUI

class ConversationCellViewModel: ObservableObject {
    @Published var message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    var fullname: String {
        guard let user = message.user else { return ""}
        return user.fullname
    }
    
    func fetchUser() {
        collectionUsers.document(chatPartnerId).getDocument { snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)
            
        }
    }
}
