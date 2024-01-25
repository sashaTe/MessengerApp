//
//  AuthViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 25.01.2024.
//

import Firebase
import UIKit


class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    override init() {
        userSession = Auth.auth().currentUser
    }
    func login(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to SIGN IN with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullName: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { results, error in
            if let error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = results?.user else { return }
            self.tempCurrentUser = user

            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullName]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
        }


        
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {
            print ("NO user uid found")
            return}
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl" : imageUrl]) { _ in
                print("Successfully updated user data")
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
