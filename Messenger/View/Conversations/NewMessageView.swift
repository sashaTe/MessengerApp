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
    @Binding var user: User?
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = NewMessageViewModel()
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                SearchBar(text: $searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                    
                VStack(alignment:.leading) {
                    ForEach(viewModel.users) { user in
                        Button(action: {
                            showChatView.toggle()
                            self.user = user
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            UserCell(user: user)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessageView(showChatView: .constant(true), user: .constant(User.init(username: "TIM", fullname: "TIM COOK", email: "Tim@apple.com", profileImageUrl: "nil")) )
}
