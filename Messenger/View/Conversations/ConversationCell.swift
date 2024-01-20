//
//  UserCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                //image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundStyle(.accent)
                //message info
                VStack(alignment: .leading) {
                 Text("Tim Cook")
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.white)
                    Text("Hello! How are you doing? Do you have plans on Monday?")
                        .font(.caption)
                        .foregroundStyle(.white).opacity(0.7)
                }
                Spacer()
            }
            Divider()
        }
        
    }
}

#Preview {
    ConversationCell()
}
