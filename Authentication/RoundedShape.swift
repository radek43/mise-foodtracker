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
    
    // MARK: - BODY
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii:  CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
}
