//
//  RecipeCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI


struct RecipeCard: View {

    // MARK: - PROPERTIES
    
    // de adaugat argumente card-ului
    // pentru a putea fi mai modular
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Image("foodImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    Text("Souvlaki Grecesc")
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .frame(maxWidth: 140)
                        .padding()
                    
                }
        }
        .frame(width: 160, height: 217, alignment: .top)
        //.background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }
}

// MARK: - PREVIEW

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard()
    }
}
