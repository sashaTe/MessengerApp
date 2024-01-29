//
//  RegistrationView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
            ZStack {
                Color.background
                    .ignoresSafeArea()
                NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser) { }
                VStack() {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("So,")
                                .foregroundStyle(.specPurple)
                                .font(.largeTitle)
                            Text("Who are you?")
                                .foregroundStyle(.accent)
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                    
                    VStack(spacing: 40){
                        CustomTextField(titleKey: "Email", textBinding: $email, imageName: "mail", height: 50, isSecured: false)
                        CustomTextField(titleKey: "Username", textBinding: $username, imageName: "person", height: 50, isSecured: false)
                        CustomTextField(titleKey: "Full Name", textBinding: $fullName, imageName: "person", height: 50, isSecured: false)
                        CustomTextField(titleKey: "Password", textBinding: $password, imageName: "lock", height: 50, isSecured: true)
                    }
                    .padding([.top],25)
                    .foregroundStyle(.accent)
//                    Spacer()
                    Button(action: {viewModel.register(withEmail: email, password: password, fullName: fullName, username: username)},
                           label: {
                        Text("Sign Up")
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.specBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    .padding(.top, 40)
                    Spacer()
                    Button(action: {mode.wrappedValue.dismiss()}, label: {
                        Text("Already have an account? Sign in")
                    })
                   
                }
                .padding(.horizontal)
                .padding(.top, 40)
            }
            .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
