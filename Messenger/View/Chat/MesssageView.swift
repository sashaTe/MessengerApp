//
//  MesssageView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI
import Kingfisher

struct MesssageView: View {
    let viewModel: MessageViewModel

    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                Spacer()
                Text(viewModel.message.text)
                      .padding(10)
                      .background(Color.specPurple)
                      .font(.caption)
                      .clipShape(ChatBubble(isFromCurrentUser: true))
                      .foregroundStyle(.white)
                      .padding(.leading, 200)
                      .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(viewModel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding(10)
                        .background(Color.specBlack)
                        .font(.caption)
                        .clipShape(ChatBubble(isFromCurrentUser: true))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                .padding(.trailing, 150)
            }
        }
    }
}

//#Preview {
//    MesssageView(isFromCurrentUser: true, messageText: "How are you doing?")
//}
