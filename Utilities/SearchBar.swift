//
//  SearchBar.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 04.10.2022.
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
                .background(Color("CardBackground"))
                .cornerRadius(10)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.formText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                )
        }
    }
}

// MARK: - PREVIEWS
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                SearchBar(placeholderText: "Găseste-ți inspirația", text: .constant(""))
                    .padding()
            }
            
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                SearchBar(placeholderText: "Găseste-ți inspirația", text: .constant(""))
                    .padding()
                    .preferredColorScheme(.dark)
            }
        }
        
    }
}
