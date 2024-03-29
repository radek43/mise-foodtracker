//
//  RecipeEditView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.04.2023.
//

import SwiftUI
import Combine
import KeyboardToolbars


struct RecipeEditView: View {
    // MARK: - PROPERTIES
    @StateObject var recipeEditViewModel = RecipeEditViewModel()
    
    @State private var title: String
    @State private var time_minutes: String
    @State private var description: String
    @State private var ingredients: String
    @State private var calories: String
    @State private var protein: String
    @State private var carbs: String
    @State private var fibers: String
    @State private var fat: String
    
    @State private var selectedCategory = Category.supa.rawValue
    let category: [String] = Category.allCases.map { $0.rawValue }
    let recipeId: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    init(recipe: Recipe) {
        UITableView.appearance().showsVerticalScrollIndicator = false
        
        _title = State(initialValue: recipe.title)
        _time_minutes = State(initialValue: String(recipe.time_minutes))
        _description = State(initialValue: recipe.description)
        _ingredients = State(initialValue: recipe.ingredients)
        _calories = State(initialValue: String(recipe.calories))
        _protein = State(initialValue: String(recipe.protein))
        _carbs = State(initialValue: String(recipe.carbs))
        _fibers = State(initialValue: String(recipe.fibers))
        _fat = State(initialValue: String(recipe.fat))
        _selectedCategory = State(initialValue: recipe.category)
        
        self.recipeId = recipe.id
    }

    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // Title
                Section(header: Text("Titlu rețetă:")) {
                    TextField("Supă de legume", text: $title)
                }
                // Category
                Section(header: Text("Categorie:")) {
                    Picker("Alege o categorie:", selection: $selectedCategory) {
                        ForEach(category, id: \.self) {
                            Text($0)
                        }
                    }
                }
                // Recipe duration
                Section(header: Text("Durată preparare:")) {
                    TextField("Durata in minute", text: $time_minutes)
                        .numbersOnly($time_minutes)
                }
                // Recipe meta
                Section(header: Text("Valori nutritive: ")) {
                    HStack {
                        Text("Calorii:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $calories)
                            .numbersOnly($calories, includeDecimal: true, decimalPlaces: 2)
                    }
                    HStack {
                        Text("Proteine:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $protein)
                            .numbersOnly($protein, includeDecimal: true, decimalPlaces: 2)
                    }
                    HStack {
                        Text("Grăsimi:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $fat)
                            .numbersOnly($fat, includeDecimal: true, decimalPlaces: 2)
                    }
                    HStack {
                        Text("Fibre:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $fibers)
                            .numbersOnly($fibers, includeDecimal: true, decimalPlaces: 2)
                    }
                    HStack {
                        Text("Carbohidrați:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $carbs)
                            .numbersOnly($carbs, includeDecimal: true, decimalPlaces: 2)
                    }
                }
                // Ingredients
                Section(header: Text("Ingrediente:")) {
                    TextEditor(text: $ingredients)
                        .frame(minHeight: 150, alignment: .leading)
                }
                // Directions
                Section(header: Text("Mod preparare:")) {
                    TextEditor(text: $description)
                        .frame(minHeight: 150, alignment: .leading)
                }
                // Image picker
                Section(header: Text("Poză preparat:")) {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        if let profileImage = recipeImage {  // An image was picked
                            profileImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .listRowInsets(EdgeInsets())
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            Text("Adaugă o imagine")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                }
            } //: END FORM
            .frame(maxWidth: 580)
            .navigationTitle("Editează rețeta")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await self.recipeEditViewModel.updateRecipe(id: recipeId, title: title, category: selectedCategory, time_minutes: Int(time_minutes)!, description: description, ingredients: ingredients, calories: calories, protein: protein, carbs: carbs, fibers: fibers, fat: fat, image: selectedImage)
                    }
                }
            }
            .onReceive(recipeEditViewModel.$didUpdateRecipe, perform: { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

// MARK: - EXTENSIONS
extension RecipeEditView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
}

// MARK: - PREVIEWS
struct RecipeEditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RecipeEditView(recipe: recipeDetailPreviewData)
            }
            NavigationView {
                RecipeEditView(recipe: recipeDetailPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
