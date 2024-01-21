//
//  ChatsView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                //messages
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach((0...10), id: \.self) { _ in
                            MesssageView(isFromCurrentUser: false)
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
        print("Send message \(messageText)")
        messageText = ""
    }
}

#Preview {
    ChatView()
}
