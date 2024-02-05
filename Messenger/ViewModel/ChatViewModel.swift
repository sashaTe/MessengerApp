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
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        let query = collectionMessages.document(currentUid).collection(chatPartnerId)
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            var messages = documents.compactMap{ try? $0.data(as: Message.self) }
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = self.user
            }
            self.messages = messages
        }


    }

    
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
