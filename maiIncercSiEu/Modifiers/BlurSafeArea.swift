//
//  BlurSafeArea.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct BlurSafeArea: ViewModifier {
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
                Color("ColorBackground")
                    .frame(height: 1)
                    .background(Material.bar)
            }
    }
}
