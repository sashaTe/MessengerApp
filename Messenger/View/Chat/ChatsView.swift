//
//  ChatsView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                //messages
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach((0...10), id: \.self) { _ in
                            MesssageView(isFromCurrentUser: false)
                        }
                    }
                }
                //input view
            }
            .navigationTitle("Tim")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            .foregroundStyle(.accent)
        }
    }
}

#Preview {
    ChatView()
}
