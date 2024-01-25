//
//  ProfilePhotoSelectorView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 25.01.2024.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @ObservedObject var viewModel = AuthViewModel()
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Button(action: {imagePickerPresented.toggle()}, label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                    }
                })
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage , content: {
                    ImagePicker(selectedAvatar: $selectedImage, isPhotoPickerShowing: $imagePickerPresented)
                })
                Text(profileImage == nil ? "Select profile photo" : "Great! Tap below to continue")
                    .foregroundStyle(.accent)
                
                if let image = selectedImage {
                    Button {
                        viewModel.uploadProfileImage(image)
                    } label: {
                        Text("Continue")
                            .font(.headline)
                            .foregroundStyle(.accent)
                            .frame(width: 340, height: 50)
                            .background(Color.specBlue)
                            .clipShape(Capsule())
                            .padding()
                    }
                    .padding(.top, 25)

                }
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
