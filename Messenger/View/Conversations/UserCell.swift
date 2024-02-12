//
//  UserCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                //image
                KFImage(URL(string: user.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .foregroundStyle(.accent)
                //message info
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.white)
                    Text(user.fullname)
                        .font(.caption)
                        .foregroundStyle(.white).opacity(0.7)
                }
                Spacer()
            }
            Divider()
        }
        .padding(.top)
        .padding(.horizontal)
        
    }
}

#Preview {
    UserCell(
        user: .init(username: "TIMCOOK", fullname: "TIM COOK", email: "tim@apple.com", profileImageUrl: "nil")
    )
}
