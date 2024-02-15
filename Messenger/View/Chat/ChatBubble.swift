//
//  ChatBubble.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 21.01.2024.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    func path(in rect: CGRect) -> Path {
        let topLeft: UIRectCorner  = isFromCurrentUser ? .topLeft : .bottomRight
        let topRight: UIRectCorner = .topRight
        let bottomLeft: UIRectCorner = .bottomLeft
        let bottomRight: UIRectCorner = isFromCurrentUser ? .topLeft : .bottomRight
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [topLeft, topRight, bottomLeft, bottomRight], cornerRadii: CGSize(width: 16, height: 16))
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
    

}

#Preview {
    ChatBubble(isFromCurrentUser: true)
}
