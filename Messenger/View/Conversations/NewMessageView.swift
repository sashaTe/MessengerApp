//
//  NewMessageView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct NewMessageView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment:.leading) {
                    ForEach((0...10), id: \.self) { _ in
                    UserCell()
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessageView()
}
