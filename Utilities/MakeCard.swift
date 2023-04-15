//
//  MakeCard.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 5/8/22.
//

import SwiftUI


struct MakeCard: ViewModifier {
    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .padding(.horizontal)
            .frame(maxWidth: 580)
    }
}

// MARK: - EXTENSIONS
extension View {
    func card() -> some View {
        self.modifier(MakeCard())
    }
}

// MARK: - PREVIEWS
struct MakeCard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = User(fullname: "George Popescu", name: "popescu.george", email: "george.popescu@yahoo.com", is_staff: false)
        return Group {
            TabBar()
            TabBar()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
