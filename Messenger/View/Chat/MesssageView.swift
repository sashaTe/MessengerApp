//
//  MesssageView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI

struct MesssageView: View {
    var isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Text("Some message for nowSome message for now")
                      .padding(10)
                      .background(Color.specPurple)
                      .font(.caption)
                      .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                      .foregroundStyle(.white)
                      .padding(.leading, 100)
                      .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                  Text("Some message for nowSome message for now")
                        .padding(10)
                        .background(Color.specBlack)
                        .font(.caption)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                .padding(.trailing, 120)
            }
        }
    }
}

#Preview {
    MesssageView(isFromCurrentUser: true)
}
