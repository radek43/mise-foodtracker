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
        //.frame(width: UIScreen.main.bounds.width * 0.85)
            .padding()
            .background(Color(UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 10)
            
    }
}

struct MakeCard_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(AuthViewModel())
    }
}
