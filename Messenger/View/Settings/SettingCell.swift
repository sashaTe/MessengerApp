//
//  SettingCell.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct SettingCell: View {
    let viewModel: SettingsCellViewModel
    var body: some View {
        VStack {
            HStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(viewModel.title)
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


