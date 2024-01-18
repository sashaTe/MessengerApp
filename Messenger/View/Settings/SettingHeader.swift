//
//  SettingHeader.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct SettingsHeader: View {
    var body: some View {
        ZStack {
            Color.specBlack
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text("Tim Cook")
                    Text("Online")
                }
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    SettingsHeader()
}
