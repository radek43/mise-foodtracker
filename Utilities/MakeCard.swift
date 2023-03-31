//
//  MakeCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/8/22.
//

import SwiftUI

struct MakeCard: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 580)
            .padding()
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .padding(.horizontal)
    }
}

extension View {
    func card() -> some View {
        self.modifier(MakeCard())
    }
}

struct MakeCard_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
