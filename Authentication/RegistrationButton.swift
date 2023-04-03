//
//  RegistrationButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 1/12/23.
//

import SwiftUI


struct RegistrationButton: View {
    // MARK: - PROPERTIES
    var text: String
    
    // MARK: - BODY
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 340, height: 50)
            .background(Color.accent)
            .clipShape(Capsule())
            .padding()
            .shadow(color: Color.black.opacity(0.1), radius: 12)
    }
}


// MARK: - PREVIEWS
struct RegistrationButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegistrationButton(text: "Inregistreaza-te")
            RegistrationButton(text: "Inregistreaza-te")
                .preferredColorScheme(.dark)
        }
    }
}
