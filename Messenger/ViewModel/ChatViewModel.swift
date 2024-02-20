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
        let query = collectionMessages
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
            
            
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap{ try? $0.document.data(as: Message.self) }
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
            if !self.messages.contains(where: {$0.id == message.id}) {
                messages[index].user = self.user
//                self.messages.append(messages[index])

            }
            }
            self.messages.append(contentsOf: messages)

        }

    }

    
    func sendMessage(_ messageText: String, imageUrl: String?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef = collectionMessages.document(currentUid).collection(chatPartnerId)
        let chatPartnerRef = collectionMessages.document(chatPartnerId).collection(currentUid)
        
        let recentCurrentRef = collectionMessages.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef = collectionMessages.document(chatPartnerId).collection("recent-messages").document(currentUid)
        
        var data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())
        ]
        
        if let imageUrl = imageUrl {
            data["imageUrl"] = imageUrl
        }
        
        currentUserRef.addDocument(data: data)
        chatPartnerRef.addDocument(data: data)
        
        recentCurrentRef.setData(data)
        recentPartnerRef.setData(data)
    }

}
