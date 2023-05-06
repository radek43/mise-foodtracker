//
//  InputField.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.08.2022.
//

import SwiftUI


struct InputField: View {
    // MARK: - PROPERTIES
    let imageName: String
    var notSystemImage: Bool? = false
    let placeholderText: String
    var isSecureField: Bool? = false
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
struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                InputField(imageName: "envelope",
                                  placeholderText: "Email",
                                  isSecureField: false,
                                  text: .constant(""))
            }
            
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                InputField(imageName: "envelope",
                                  placeholderText: "Email",
                                  isSecureField: false,
                                  text: .constant(""))
                    .preferredColorScheme(.dark)
            }
        }
    }
}
