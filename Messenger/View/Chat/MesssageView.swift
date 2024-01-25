//
//  MesssageView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI

struct MesssageView: View {
    var isFromCurrentUser: Bool
    var messageText: String
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text(messageText)
                      .padding(10)
                      .background(Color.specPurple)
                      .font(.caption)
                      .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                      .foregroundStyle(.white)
                      .padding(.leading, 200)
                      .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                  Text(messageText)
                        .padding(10)
                        .background(Color.specBlack)
                        .font(.caption)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                .padding(.trailing, 150)
            }
        }
    }
}

#Preview {
    MesssageView(isFromCurrentUser: true, messageText: "How are you doing?")
}
