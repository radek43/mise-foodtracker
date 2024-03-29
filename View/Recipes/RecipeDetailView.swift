//
//  RecipeDetailView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 16.04.2022.
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
        if let user = authViewModel.currentUser {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                if let recipe = recipeDetailViewModel.recipe {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            // Recipe image
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
                        
                        // Recipe details
                        VStack(spacing: 20) {
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
                                    Text("• Calorii: \(recipe.calories, specifier: "%.f")kCal")
                                    Text("• Proteine: \(recipe.protein, specifier: "%.1f")g")
                                    Text("• Lipide: \(recipe.fat, specifier: "%.1f")g")
                                    Text("• Carbohidrați: \(recipe.carbs, specifier: "%.1f")g")
                                    Text("• Fibre: \(recipe.fibers, specifier: "%.1f")g")
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
                            .card()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ingrediente:")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Divider()
                                Text(recipe.ingredients)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .card()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Mod de preparare:")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Divider()
                                Text(recipe.description)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .card()
                            
                            NavigationLink {
                                RecipeConfirmView(recipe: Food(id: recipe.id, title: recipe.title, calories: recipe.calories, carbs: recipe.carbs, fibers: recipe.fibers, fat: recipe.fat, protein: recipe.protein, estimates: ""))
                            } label: {
                                RectangleButton(text: "Adaugă la jurnal")
                            }

                            
                        }
                        .navigationBarItems(trailing: user.is_staff == true ?
                            HStack(spacing: 15) {
                                NavigationLink {
                                    RecipeEditView(recipe: recipe)
                                } label: {
                                    HStack {
                                        Text("Editează")
                                        Image(systemName: "highlighter")
                                    }
                                }
                                Button {
                                     showDeleteConfirmation.toggle()
                                } label: {
                                    HStack {
                                        Text("Șterge")
                                            .foregroundColor(Color.red)
                                        Image(systemName: "trash")
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
                    }
                    .frame(maxWidth: 580)
                }
            }
            .onAppear {
                Task(priority: .medium) {
                    try await self.recipeDetailViewModel.fetchRecipe()
                }
            }
            .navigationBarTitle(user.is_staff == true ? "" : "Detalii Rețetă", displayMode: .inline)
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
