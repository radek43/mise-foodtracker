//
//  RoundedShape.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/9/22.
//

import SwiftUI

struct RoundedShape: Shape {
    // MARK: - PROPERTIES
    var corners: UIRectCorner
    var cornerRadius: Double
    // MARK: - BODY
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:  CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}
