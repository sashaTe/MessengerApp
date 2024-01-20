//
//  ImagePicker.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedAvatar: UIImage?
    @Binding var isPhotoPickerShowing: Bool
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}


class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // run code when the user has selected an image
        print("image selected")
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.parent.selectedAvatar = image
            }
        }
        parent.isPhotoPickerShowing = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // run code when the user has cancelled the picker UI
        parent.isPhotoPickerShowing = false

    }
}
