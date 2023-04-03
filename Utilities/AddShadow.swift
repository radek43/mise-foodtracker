//
//  AddShadow.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12/21/22.
//

import SwiftUI


struct AddShadow: ViewModifier {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    var opacity: Double
    var radius: Double
    var x: Double
    var y: Double
    
    // MARK: - BODY
    func body(content: Content) -> some View {
        if colorScheme != .dark {
            content
                .shadow(color: Color.gray.opacity(opacity), radius: radius, x: x, y: y)
        } else {
            content
        }
    }
}

// MARK: - PREVIEWS
struct AddShadow_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        //            .environmentObject(AuthViewModel())
    }
}
