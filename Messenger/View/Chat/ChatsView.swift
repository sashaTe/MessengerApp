//
//  ChatsView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @State private var scrollTarget: String?
    @State var keyboardHeight: CGFloat = 0
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
                scrollView
                CustomInputView(text: $messageText, action: sendMessage)
            }
            .navigationTitle(user.username)
            .navigationBarColor(UIColor(Color.accentColor))
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            .foregroundStyle(.accent)
        }
        .onAppear(perform: {
//            viewModel.fetchMessages()
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (data) in
                let height = data.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
                self.keyboardHeight = height.cgRectValue.height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main){ (_) in
                self.keyboardHeight = 0
            }
        })
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
//        viewModel.fetchMessages()
    }
}
//
//#Preview {
//    ChatView(user: User.init(username: "TIMCOOK", fullname: "TIM COOK", email: "tim@apple.com", profileImageUrl: nil))
//}

extension ChatView {
    
    var scrollView: some View {
        ScrollView {
            ScrollViewReader { scrollView in
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MesssageView(viewModel: MessageViewModel( message))
                            .id(message.id)
                    }
                    .onChange(of: scrollTarget) { target in
                        withAnimation {
                            scrollView.scrollTo(target, anchor: .bottom)
                        }
                    }
                    .onChange(of: keyboardHeight){ target in
                        if(nil != scrollTarget){
                            withAnimation {
                                scrollView.scrollTo(scrollTarget, anchor: .bottom)
                            }
                        }
                    }
                    .onAppear(perform: {
                        withAnimation {
                        if !viewModel.messages.isEmpty {
                           
                                self.scrollTarget = viewModel.messages.last?.id
                                scrollView.scrollTo(scrollTarget, anchor: .bottom)
                            }
                           
                        }
                    })
                    .onReceive(viewModel.$messages) { messages in
                        if !viewModel.messages.isEmpty {
                            self.scrollTarget = messages.last!.id
                            scrollView.scrollTo(scrollTarget, anchor: .bottom)
                        }

                    }
                }
            }
            
        }
    }
}
