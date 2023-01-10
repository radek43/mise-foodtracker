//
//  RecipeDetailView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    // MARK: - PROPERTIES
    var recipe = Recipe.dummyData[1]
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color(.gray))
                            .aspectRatio(4/4, contentMode: .fit)
                        WebImage(url: URL(string: recipe.image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                    }
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding()
                    
                    

                    VStack(spacing: 30) {
                        Text(recipe.name)
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                        VStack(alignment: .leading, spacing: 30) {
                            if !recipe.description.isEmpty {
                                Text(recipe.description)
                            }
                            Divider()
                            // Detalii valori nutritionale
                            if !recipe.ingredients.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Ingrediente:")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text(recipe.ingredients.replacingOccurrences(of: "•", with: "\n •"))
                                }
                            }
                            Divider()
                            if !recipe.directions.isEmpty {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Mod Preparare:")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text(recipe.directions.replacingOccurrences(of: "•", with: "\n •"))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: 612)
                    .padding(.horizontal)
                    .toolbar {
                        Button {
                            print("reteta inregistrata in jurnal")
                        } label: {
                            HStack {
                                Text("Adauga la jurnal")
                                Image(systemName: "text.badge.plus")
                            }
                        }
                    }
                }
            }
        }
    }
}
// MARK: - PREVIEW
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
            .environmentObject(AuthViewModel())
    }
}
