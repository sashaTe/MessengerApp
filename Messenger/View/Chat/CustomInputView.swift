//
//  CustomInputView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text: String
    var action: () -> Void
    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            
            HStack {
                TextField("", text: $text)
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: {action()}, label: {
                    Text("Send")
                        .bold()
                        .foregroundStyle(.accent)
                })
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
    }
}
//
//#Preview {
//    CustomInputView(text: .constant(""))
//}
