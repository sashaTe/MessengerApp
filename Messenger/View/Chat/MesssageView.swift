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
                VStack(alignment: .trailing) {
                    Text(viewModel.time)
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .opacity(0.2)
                    Text(viewModel.message.text)
                          .padding(15)
                          .background(Color.specPurple)
                          .font(.caption)
                          .clipShape(ChatBubble(isFromCurrentUser: true))
                          .foregroundStyle(.white)
                }
                .padding(.leading, 200)
                .padding(.horizontal)
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        KFImage(viewModel.profileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 27, height: 27)
                            .clipShape(Circle())
                        Group {
                            Text(viewModel.fullname)
                                .font(.caption)
                                .foregroundStyle(.white)
                                .opacity(0.5)
                            Text(viewModel.time)
                                .font(.caption2)
                                .foregroundStyle(.white)
                                .opacity(0.2)
                                .padding(.leading, 5)
                        }
                    }
                HStack(alignment: .center) {

                        Text(viewModel.message.text)
                            .padding(15)
                            .background(Color.specBlack)
                            .font(.caption)
                            .clipShape(ChatBubble(isFromCurrentUser: false))
                            .foregroundStyle(.white)
                            
                    }
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
