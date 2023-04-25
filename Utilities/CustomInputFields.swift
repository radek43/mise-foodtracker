//
//  CustomInputFields.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.08.2022.
//

import SwiftUI


struct CustomInputFields: View {
    // MARK: - PROPERTIES
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    var notSystemImage: Bool? = false
    @Binding var text: String
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                if notSystemImage ?? false {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.secondary)
                } else {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.secondary)
                }
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                        .autocapitalization(.none)
                } else {
                    TextField(placeholderText, text: $text)
                        .autocapitalization(.none)
                }
            }
        }
        .card()
    }
}

// MARK: - PREVIEW
struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                CustomInputFields(imageName: "envelope",
                                  placeholderText: "Email",
                                  isSecureField: false,
                                  text: .constant(""))
            }
            
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                CustomInputFields(imageName: "envelope",
                                  placeholderText: "Email",
                                  isSecureField: false,
                                  text: .constant(""))
                .preferredColorScheme(.dark)
            }
        }
    }
}