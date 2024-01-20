//
//  UserCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                //image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .foregroundStyle(.accent)
                //message info
                VStack(alignment: .leading) {
                 Text("Tim Cook")
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.white)
                    Text("@timCook")
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
    UserCell()
}
