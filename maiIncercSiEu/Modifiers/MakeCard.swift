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
            .frame(width: UIScreen.main.bounds.width * 0.85)
            .padding()
            .background(Color(UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 12)
    }
}

struct MakeCard_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(AuthViewModel())
    }
}
