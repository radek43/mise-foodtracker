//
//  MakeCard.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.05.2022.
//

import SwiftUI


struct MakeCard: ViewModifier {
    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
            .frame(maxWidth: 580)
            .padding(.horizontal)
    }
}


// MARK: - PREVIEWS
struct MakeCard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            HomeView(tabSelection: .constant(1))
            HomeView(tabSelection: .constant(1))
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}


// MARK: - EXTENSIONS
extension View {
    func card() -> some View {
        self.modifier(MakeCard())
    }
}
