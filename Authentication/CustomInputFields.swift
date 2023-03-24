//
//  CustomInputFields.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/9/22.
//

import SwiftUI

struct CustomInputFields: View {
    // MARK: - PROPERTIES
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.secondary)
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                        .autocapitalization(.none)
                } else {
                    TextField(placeholderText, text: $text)
                        .autocapitalization(.none)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

// MARK: - PREVIEW
struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomInputFields(imageName: "envelope",
                              placeholderText: "Email",
                              isSecureField: false,
                              text: .constant(""))
            CustomInputFields(imageName: "envelope",
                              placeholderText: "Email",
                              isSecureField: false,
                              text: .constant(""))
            .preferredColorScheme(.dark)
        }
        
    }
}
