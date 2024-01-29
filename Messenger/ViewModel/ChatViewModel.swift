//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    let user: User
    init(user: User) {
        self.user = user
    }
//    var mockMessages: [Message] {
//        [
//            .init(isFromCurrentUser: true, messageText: "Hi! How are you doing?"),
//            .init(isFromCurrentUser: false, messageText: "I'm ok, you?"),
//            .init(isFromCurrentUser: true, messageText: "I'm fine"),
//            .init(isFromCurrentUser: true, messageText: "What you doing today?"),
//            .init(isFromCurrentUser: false, messageText: "Chilling"),
//            .init(isFromCurrentUser: true, messageText: "Wanna go footbal?"),
//            .init(isFromCurrentUser: true, messageText: "at 8PM")
//
//        ]
//    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef = collectionMessages.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = collectionMessages.document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())
        ]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
    }
}
