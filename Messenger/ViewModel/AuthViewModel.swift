//
//  AuthViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 25.01.2024.
//

import Firebase


class AuthViewModel: NSObject, ObservableObject {
    func login() {
        print("Login viewModel")
    }
    
    func register(withEmail email: String, password: String, fullName: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { results, error in
            if let error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = results?.user else { return }
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullName]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                print("Updated userInfo in firestore")
            }
        }


        
    }
    
    func uploadProfileImage() {
        
    }
    
    func signOut() {
        
    }
}
