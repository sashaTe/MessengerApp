//
//  ConversationsViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 11.02.2024.
//

import SwiftUI

class ConversationsViewModel: ObservableObject {
    
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let query = collectionMessages.document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.recentMessages = documents.compactMap({try? $0.data(as: Message.self)})
        }
    }
}
