//
//  ChatsView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                //messages
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MesssageView(viewModel: MessageViewModel( message))
                        }
                    }
                }
                CustomInputView(text: $messageText, action: sendMessage)
            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            .foregroundStyle(.accent)
        }
        .onAppear(perform: {
            viewModel.fetchMessages()
        })
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
        viewModel.fetchMessages()
    }
}
//
//#Preview {
//    ChatView(user: User.init(username: "TIMCOOK", fullname: "TIM COOK", email: "tim@apple.com", profileImageUrl: nil))
//}
