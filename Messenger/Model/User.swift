//
//  User.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 28.01.2024.
//

import FirebaseFirestoreSwift
import Foundation

// TODO: 
struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
    
}


