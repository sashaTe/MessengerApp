//
//  ChatsView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                //messages
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MesssageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                        }
                    }
                }
                CustomInputView(text: $messageText, action: sendMessage)
            }
            .navigationTitle("Tim")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            .foregroundStyle(.accent)
        }
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

#Preview {
    ChatView()
}
