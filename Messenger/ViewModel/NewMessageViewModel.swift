//
//  NewMessageViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 29.01.2024.
//

import Foundation
import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        print("Start fetch users")
        collectionUsers.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({try? $0.data(as: User.self)})

        }
    }
}
