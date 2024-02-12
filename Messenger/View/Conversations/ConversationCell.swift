//
//  UserCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: MessageViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                //image
                KFImage(viewModel.chatPartnerProfileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundStyle(.accent)
                //message info
                VStack(alignment: .leading) {
                    Text(viewModel.fullname)
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(.white)
                    
                    Text(viewModel.message.text)
                        .font(.caption)
                        .foregroundStyle(.white).opacity(0.7)
                }
                Spacer()
            }
            Divider()
        }
        .onAppear {
            viewModel.fetchUser()
        }
        
    }
}

//#Preview {
//    ConversationCell()
//}
