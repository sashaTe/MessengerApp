//
//  EditProfileView.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullName = "Tim Cook"
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack(alignment:.leading, spacing: 45) {
                //header
                VStack {
                    //photo/edit button/text
                    HStack {
                        //photo/edit button
                        VStack {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                            
                            Button {
                                
                            } label: {
                                Text("Edit")
                            }

                        }
                        Text("Enter your name or change your profile photo")
                            .font(.system(size: 16))
                    }
                    
                    Divider()
                        .foregroundStyle(Color.accentColor)
                        .padding(.horizontal)
                    
                    TextField("", text: $fullName)
                        .padding(8)
                }
                .background(Color.specPurple)

                
                VStack(alignment:.leading) {
                    //status text
                    Text("Status")
                        .foregroundStyle(.specBlack)
                    //status
                    NavigationLink {
                        StatusSelectorView()
                    } label: {
                        HStack {
                            Text("At the movies")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.accent)
                        }
                        .padding()
                    }


                }
                Spacer()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
}

#Preview {
    NavigationView{
        EditProfileView()
    }
}
