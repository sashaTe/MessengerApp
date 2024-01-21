//
//  SearchBar.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Seardddddch...", text: $text)
                .placeholder(when: !isEditing) {
                    Text("Search...").foregroundColor(.gray)
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    hideKeyboard()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.accent)
                        
                })
                .transition(.move(edge: .trailing))
            }
                
        }
        .frame(height: 50)
        .padding(.horizontal)
        .foregroundStyle(Color.white)
        .background(Color.specBlack)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        

    }
    private func hideKeyboard() {
    // Dismiss the keyboard
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }
}

#Preview {
    SearchBar(text: .constant(""), isEditing: .constant(true))
}
