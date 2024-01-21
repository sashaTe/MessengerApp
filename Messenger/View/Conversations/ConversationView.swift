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
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.background.ignoresSafeArea()
            
            NavigationLink(destination: ChatView(), isActive: $showChatView) { }
            ScrollView {
                VStack(alignment: .leading) {
                    HStack { Spacer()}
                    ForEach((0...10), id: \.self) {_ in
                        NavigationLink {
                            ChatView()
                        } label: {
                            ConversationCell()
                        }


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
                NewMessageView(showChatView: $showChatView)
            })
        }
        
            
    }
}

#Preview {
    ConversationsView()
}
