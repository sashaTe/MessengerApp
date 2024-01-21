//
//  MesssageView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI

struct MesssageView: View {
    var isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser {
                
            } else {
                HStack(alignment: .bottom) {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                  
                }
            }
        }
    }
}

#Preview {
    MesssageView(isFromCurrentUser: false)
}
