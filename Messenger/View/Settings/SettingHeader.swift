//
//  SettingHeader.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI
import Kingfisher

struct SettingsHeader: View {
    let user: User

    var body: some View {
        ZStack {
            Color.specBlack
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                KFImage(URL(string: user.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(user.fullname)
                        .foregroundStyle(.specPurple)
                        .font(.headline)
                    Text("Online")
                        .font(.callout)
                        .opacity(0.9)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

//#Preview {
//    SettingsHeader()
//}
