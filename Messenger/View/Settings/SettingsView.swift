//
//  SettingsView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
            ZStack {
                Color.background.ignoresSafeArea()
                VStack(spacing: 32){
                    
                    NavigationLink {
                        EditProfileView()
                    } label: {
                        SettingsHeader()
                    }

                    
                    
                    VStack(spacing: 1){
                        ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                            SettingCell(viewModel: viewModel)
                        }
                    }

                    Button(action: {},
                           label: {
                        Text("Log Out")
                            .foregroundStyle(.red)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.specBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    
                    Spacer()
                }
                    .foregroundStyle(.accent)
            }
        
    }
}

#Preview {
    SettingsView()
}


