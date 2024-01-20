//
//  UserCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack {
            
            //image
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            //message info
            VStack(alignment: .leading) {
             Text("Tim Cook")
                    .font(.caption)
                    .bold()
                Text("")
            }
        }
    }
}

#Preview {
    ConversationCell()
}
