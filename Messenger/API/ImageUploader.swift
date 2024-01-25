//
//  ImageUploader.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 25.01.2024.
//

import FirebaseStorage
import UIKit


struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/ profile_images/\(fileName)")
        
        ref.putData(imageData) { _, error in
            if let error {
                print("Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image to firebase storage")
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
