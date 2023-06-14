//
//  AddRecipeView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.12.2022.
//

import SwiftUI
import Combine
import KeyboardToolbars


struct AddRecipeView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel = AddRecipeViewModel()
    
    @ObservedObject var recipeViewModel: RecipeListViewModel
    
    @State private var title = ""
    @State private var time_minutes = ""
    @State private var description = ""
    @State private var ingredients = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fibers = ""
    @State private var fat = ""
    
    @State private var selectedCategory = Category.supa.rawValue
    
    let category: [String] = Category.allCases.map { $0.rawValue }
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    var isDisabled: Bool {
        if title.isEmpty || time_minutes.isEmpty || description.isEmpty || ingredients.isEmpty || calories.isEmpty || protein.isEmpty || carbs.isEmpty || fibers.isEmpty || fat.isEmpty {
            return true
        } else {
            return false
        }
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
                // Time minutes
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
                        .frame(height: 150, alignment: .leading)
                }
                // Directions
                Section(header: Text("Mod preparare:")) {
                    TextEditor(text: $description)
                        .frame(height: 150, alignment: .leading)
                }
                // Image
                Section(header: Text("Poză preparat:")) {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        if let profileImage = recipeImage {    // an image was picked
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
            }
            .frame(maxWidth: 580)
            .navigationTitle("Adaugă o retetă nouă")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await self.viewModel.postRecipe(title: title, category: selectedCategory, time_minutes: Int(time_minutes)!, description: description, ingredients: ingredients, calories: calories , protein: protein, carbs: carbs, fibers: fibers, fat: fat, image: selectedImage)
                    }
                }
                .disabled(isDisabled)
            }
            .onReceive(viewModel.$didUploadRecipe, perform: { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}


// MARK: - EXTENSIONS
extension AddRecipeView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
}


// MARK: - PREVIEWS
struct AddRecipeView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = RecipeListViewModel()
        return Group {
            NavigationView {
                AddRecipeView(recipeViewModel: viewModel)
            }
            NavigationView {
                AddRecipeView(recipeViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
    }
}
