//
//  CustomInputView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text: String
    @Binding var isPhotoPickerShowing: Bool
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
                
                Button {
                    
                } label: {
                   Image(systemName: "paperclip")
                        .foregroundStyle(.white)
                        .font(.title2)
                }
                .padding(.trailing, 5)
                Button(action: {action()}, label: {
                    Image(systemName: "paperplane")
                        .foregroundStyle(.black)
                        .padding(5)
                        .background(content: {
                            Color.accentColor
                        })
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(.title2)
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
