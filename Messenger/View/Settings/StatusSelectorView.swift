//
//  StatusSelectorView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct StatusSelectorView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment:.leading) {
                    Text("CURRENTLY SET TO")
                        .foregroundStyle(Color.specBlack)
                        .padding()
                    StatusCell(status: UserStatus(rawValue: 4)!)
                        .padding(.horizontal)
                        .background(Color.specPurple)
                    //status cell
                    Text("SELECT YOUR STATUS")
                    ForEach(UserStatus.allCases.filter({
                        $0 != .notConfigured
                    }), id: \.self) { status in
                        Button {
                            
                        } label: {
                            StatusCell(status: status)
                        }


                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    StatusSelectorView()
}

struct StatusCell: View {
    let status: UserStatus
    var body: some View {
        VStack(spacing: 1) {
            Text(viewModel.title)
                    .frame(height: 50)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.horizontal)
            .background(Color.specPurple)
    }
}
