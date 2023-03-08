//
//  MakeCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/8/22.
//

import SwiftUI

struct MakeCard: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        if colorScheme == .dark {
            content
                .padding()
                .background(Color("CardBackground"))
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
        } else {
            content
                .padding()
                .background(Color("CardBackground"))
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                //.shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 10)
        }
        //.frame(width: UIScreen.main.bounds.width * 0.85)
    }
}

struct MakeCard_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
//            .environmentObject(AuthViewModel())
    }
}
