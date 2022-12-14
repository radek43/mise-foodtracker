//
//  SearchBar.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/4/22.
//

import SwiftUI

struct SearchBar: View {
    
    // MARK: - PROPERTIES
    var placeholderText: String
    @Binding var text: String
    
    
    // MARK: - BODY
    var body: some View {
        HStack {
            TextField(placeholderText, text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.white))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(.horizontal, 4)
    }
}

// MARK: - PREVIEW
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(placeholderText: "Gaseste-ti inspiratia",text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
