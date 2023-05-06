//
//  CapsuleButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12.01.2023.
//

import SwiftUI


struct CapsuleButton: View {
    // MARK: - PROPERTIES
    var text: String
    
    // MARK: - BODY
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: 580)
            .background(Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .padding()
    }
}


// MARK: - PREVIEWS
struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CapsuleButton(text: "Înregistrează-te")
            CapsuleButton(text: "Înregistrează-te")
                .preferredColorScheme(.dark)
        }
    }
}
