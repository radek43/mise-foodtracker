//
//  NumbersOnlyViewModifier.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 30.03.2023.
//

import SwiftUI
import Combine


struct NumbersOnlyViewModifier: ViewModifier {
    // MARK: - PROPERTIES
    @Binding var text: String
    var includeDecimal: Bool
    var decimalPlaces: Int
    
    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .keyboardType(includeDecimal ? .decimalPad: .numberPad)
            .onReceive(Just(text)) { newValue in
                var numbers = "0123456789"
                let decimalseparator: String = Locale.current.decimalSeparator ?? "."
                if includeDecimal {
                    numbers += decimalseparator
                }
                if let dotIndex = newValue.firstIndex(of: ".") {
                    // Get the substring after the dot character
                    let substring = newValue[dotIndex...]
                    
                    // Limit the substring to 2 characters after the dot (change this value as needed)
                    let limitedSubstring = substring.prefix(decimalPlaces + 1)
                    
                    // Combine the string before the dot with the limited substring
                    let result = newValue.prefix(upTo: dotIndex) + limitedSubstring
                    
                    self.text = String(result) // Output: "This is a string with a decimal point: 3.14"
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

// MARK: - EXTENSIONS
extension View {
    func numbersOnly(_ text: Binding<String>, includeDecimal: Bool = false, decimalPlaces: Int = 0) -> some View {
        self.modifier(NumbersOnlyViewModifier(text: text, includeDecimal: includeDecimal, decimalPlaces: decimalPlaces))
    }
}
