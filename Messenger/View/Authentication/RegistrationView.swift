//
//  RegistrationView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack() {
                HStack {
                    Text("Who are you?")
                        .foregroundStyle(.accent)
                        .font(.largeTitle)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
