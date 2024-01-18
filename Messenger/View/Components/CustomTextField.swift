//
//  CustomTextField.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 18.01.2024.
//

import SwiftUI

struct CustomTextField: View {
    let titleKey: String
    let textBinding: Binding<String>
    let imageName: String
    let height: Double
    let isSecured: Bool
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundStyle(.white)
                .font(.title)
                .frame(width: 40)
            if isSecured {
                SecureField(titleKey, text: textBinding)
            } else {
                TextField(titleKey, text: textBinding)
            }
            
            
        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: height)
                .foregroundStyle(.thinMaterial)
        }
        
    }
}

#Preview {
    CustomTextField(titleKey: "Password", textBinding: .constant(""), imageName: "lock", height: 40, isSecured: true)
}
