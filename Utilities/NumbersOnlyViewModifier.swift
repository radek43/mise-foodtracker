//
//  NumbersOnlyViewModifier.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 30.03.2023.
//

import SwiftUI
import Combine

struct NumbersOnlyViewModifier: ViewModifier {
    
    @Binding var text: String
    var includeDecimal: Bool
    
    func body(content: Content) -> some View {
        content
            .keyboardType(includeDecimal ? .decimalPad: .numberPad)
            .onReceive(Just(text)) { newValue in
                var numbers = "0123456789"
                let decimalseparator: String = Locale.current.decimalSeparator ?? "."
                if includeDecimal {
                    numbers += decimalseparator
                }
                if newValue.components(separatedBy: decimalseparator).count-1 > 1 {
                    let filtered = newValue
                    self.text = String(filtered.dropLast())
                } else {
                    let filtered = newValue.filter { numbers.contains($0) }
                    if filtered != newValue {
                        self.text = filtered
                    }
                }
            }
    }
}

extension View {
    func numbersOnly(_ text: Binding<String>, includeDecimal: Bool = false) -> some View {
        self.modifier(NumbersOnlyViewModifier(text: text, includeDecimal: includeDecimal))
    }
}
