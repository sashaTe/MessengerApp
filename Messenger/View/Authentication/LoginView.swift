//
//  LoginView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack  {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello.")
                                .foregroundStyle(.specPurple)
                                .font(.largeTitle)
                            Text("Do I know you already?")
                                .foregroundStyle(.accent)
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                    
                    VStack(spacing: 40){
                        CustomTextField(titleKey: "Email", textBinding: $email, imageName: "mail", height: 50, isSecured: false)
                        CustomTextField(titleKey: "Password", textBinding: $password, imageName: "lock", height: 50, isSecured: true)
                    }
                    .padding([.top ],25)
                    .foregroundStyle(.accent)
                    HStack {
                        Spacer()
                        NavigationLink(destination: Text("Reset password")) {
                            Text("Forgot password?")
                                .foregroundStyle(.specBlue)
                                .padding(.top)
                                .padding(.trailing)
                        }
                    }
                    .padding(.bottom, 20)
                    Button(action: {viewModel.login(with: email, password: password)},
                           label: {
                        Text("Sign in")
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.specBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Spacer()
                    NavigationLink(destination: RegistrationView()) {
                        Text("Don't have an account? Sign up")
                            .foregroundStyle(.specBlue)
                            .padding(.top)
                            .padding(.trailing)
                    }
                 }
                .padding(.horizontal)
                .padding(.top, 40)
            }
        }
    }
}

#Preview {
    LoginView()
}
