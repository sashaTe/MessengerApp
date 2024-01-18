//
//  SettingCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct SettingCell: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
                    .padding(6)
                    .background(Color.specBlue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("Starred Messages")
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.accent)
                
            }
            .padding(10)
            .background(Color.specBlack)
        }
    }
}

#Preview {
    SettingCell()
}
