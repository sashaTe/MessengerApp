//
//  NewMessageView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @State private var isEditing = false
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                    
                VStack(alignment:.leading) {
                    ForEach((0...10), id: \.self) { _ in
                        Button(action: {
                            showChatView.toggle()
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            UserCell()
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessageView(showChatView: .constant(true))
}
