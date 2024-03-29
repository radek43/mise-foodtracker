//
//  RoundedShape.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.08.2022.
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
