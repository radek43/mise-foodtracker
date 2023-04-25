//
//  RecipeDetailView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var recipeDetailViewModel: RecipeDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showDeleteConfirmation = false
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                if let recipe = recipeDetailViewModel.recipe {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            // RECIPE IMAGE
                            ZStack {
                                Rectangle()
                                    .fill(Color(.gray))
                                    .aspectRatio(4/4, contentMode: .fit)
                                if let image = recipe.image {
                                    WebImage(url: URL(string: image))
                                        .onSuccess { image, data, cacheType in
                                        }
                                        .resizable()
                                        .placeholder {
                                            ProgressView()
                                        }
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fill)
                                        .layoutPriority(-1)
                                }
                            }
                        }
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        .padding()
                        
                        // RECIPE DETAILS
                        VStack(spacing: 30) {
                            Text(recipe.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Informații nutriționale:")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Divider()
                                VStack(alignment: .leading) {
                                    Text("• Calorii: \(recipe.calories)kCal")
                                    Text("• Proteine: \(recipe.protein)g")
                                    Text("• Lipide: \(recipe.fat)g")
                                    Text("• Carbohidrați: \(recipe.carbs)g")
                                    Text("• Fibre: \(recipe.fibers)g")
                                }
                                Divider()
                                VStack(alignment: .leading) {
                                    Text("Timp de preparare: \(recipe.time_minutes) minute")
                                        .font(.footnote)
                                        .foregroundColor(Color.secondary)
                                    Text("*Informații nutriționale pentru o porție de 100gr")
                                        .font(.footnote)
                                        .foregroundColor(Color.secondary)
                                }
                            }
                            .padding()
                            .background(Color.card)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ingrediente:")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Divider()
                                Text(recipe.ingredients)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding()
                            .background(Color.card)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Mod de preparare:")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Divider()
                                Text(recipe.description)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding()
                            .background(Color.card)
                            .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                            .padding(.horizontal)
                            
                            
                            Text("Adaugă la jurnal")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 340, height: 50)
                                .background(Color.accent)
                                .clipShape(Capsule())
                                .padding()
                                .padding(.bottom, 30)
                        } //: END DETAILS VSTACK
                        .navigationBarItems(trailing: authViewModel.currentUser?.is_staff == true ?
                            HStack(spacing: 15) {
                                NavigationLink {
                                    RecipeEditView(recipe: recipe)
                                } label: {
                                    HStack {
                                        Text("Editează")
                                        Image(systemName: "pencil.circle")
                                    }
                                }
                                Button {
                                     showDeleteConfirmation.toggle()
                                } label: {
                                    HStack {
                                        Text("Șterge")
                                            .foregroundColor(Color.red)
                                        Image(systemName: "trash.circle")
                                            .foregroundColor(Color.red)
                                    }
                                }
                                .alert(isPresented:$showDeleteConfirmation) {
                                    Alert(
                                        title: Text("Ești sigur că vrei să ștergi această rețetă?"),
                                        message: Text("Această acțiune este permanentă"),
                                        primaryButton: .destructive(Text("Șterge")) {
                                            Task {
                                                try await recipeDetailViewModel.deleteRecipe()
                                            }
                                            self.presentationMode.wrappedValue.dismiss()
                                        },
                                        secondaryButton: .cancel(Text("Renunță"))
                                    )
                                }
                            }
                            : nil
                        )
                    } //: END MAIN VSTACK
                    .frame(maxWidth: 580)
                } //: END SCROLL VIEW
            } //: END ZSTACK
            .onAppear {
                Task(priority: .medium) {
                    try await self.recipeDetailViewModel.fetchRecipe()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


// MARK: - PREVIEW
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        let viewModel = RecipeDetailViewModel(withrecipeId: 1)
        viewModel.recipe = recipeDetailPreviewData
        return Group {
            NavigationView {
                RecipeDetailView(recipeDetailViewModel: viewModel)
            }
            NavigationView {
                RecipeDetailView(recipeDetailViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
    }
}
