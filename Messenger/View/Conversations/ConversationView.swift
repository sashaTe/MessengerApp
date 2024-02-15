//
//  ConversationView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @StateObject var viewModel = ConversationsViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.background.ignoresSafeArea()
            if let user = selectedUser {
                NavigationLink(destination: ChatView(user: user), isActive: $showChatView) { }
            }
            ScrollView {
                VStack(alignment: .leading) {
                    HStack { Spacer()}

                    ForEach(viewModel.recentMessages) { message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                            .padding(.horizontal)
                    }
                }
            }
            
            Button(action: {
                showMessageView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding()
            })
            .background(Color.specBlue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })
        }
        
            
    }
}

#Preview {
    ConversationsView()
}
