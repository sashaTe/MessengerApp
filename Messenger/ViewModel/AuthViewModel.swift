//
//  AuthViewModel.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 25.01.2024.
//

import Firebase
import FirebaseStorage
import UIKit


class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    func login(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to SIGN IN with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
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
            collectionUsers.document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
        }


        
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {
            print ("NO user uid found")
            return}
        ImageUploader.uploadImage(image: image) { imageUrl in
            collectionUsers.document(uid).updateData(["profileImageUrl" : imageUrl]) { _ in
                self.userSession = self.tempCurrentUser
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        collectionUsers.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            
        }
    }
}
