//
//  ChatViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hi! How are you doing?"),
            .init(isFromCurrentUser: false, messageText: "I'm ok, you?"),
            .init(isFromCurrentUser: true, messageText: "I'm fine"),
            .init(isFromCurrentUser: true, messageText: "What you doing today?"),
            .init(isFromCurrentUser: false, messageText: "Chilling"),
            .init(isFromCurrentUser: true, messageText: "Wanna go footbal?"),
            .init(isFromCurrentUser: true, messageText: "at 8PM")

        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
