//
//  RectangleButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12.01.2023.
//

import SwiftUI


struct RectangleButton: View {
    // MARK: - PROPERTIES
    var text: String
    var isDisabled: Bool = false
    
    // MARK: - BODY
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: 580)
            .background(isDisabled ? Color.secondary : Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .padding()
    }
}


// MARK: - PREVIEWS
struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background.ignoresSafeArea()
                RectangleButton(text: "Înregistrează-te")
            }
            ZStack {
                Color.background.ignoresSafeArea()
                RectangleButton(text: "Înregistrează-te")
                    .preferredColorScheme(.dark)
            }
        }
    }
}
