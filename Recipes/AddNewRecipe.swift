//
//  AddNewRecipe.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12/9/22.
//

import SwiftUI
import Combine
import KeyboardToolbars


struct AddNewRecipe: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel = CreateRecipeViewModel()
    
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
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // RECIPE TITLE
                Section(header: Text("Titlu rețetă:")) {
                    TextField("Supă de legume", text: $title)
                }
                // CATEGORY
                Section(header: Text("Categorie:")) {
                    Picker("Alege o categorie:", selection: $selectedCategory) {
                        ForEach(category, id: \.self) {
                            Text($0)
                        }
                    }
                }
                // TIME MINUTES
                Section(header: Text("Durată preparare:")) {
                    TextField("Durata in minute", text: $time_minutes)
                        .numbersOnly($time_minutes)
                }
                // RECIPE VALUES
                Section(header: Text("Valori nutritive: ")) {
                    HStack {
                        Text("Calorii:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $calories)
                            .numbersOnly($calories, includeDecimal: true)
                    }
                    HStack {
                        Text("Proteine:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $protein)
                            .numbersOnly($protein, includeDecimal: true)
                    }
                    HStack {
                        Text("Grăsimi:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $fat)
                            .numbersOnly($fat, includeDecimal: true)
                    }
                    HStack {
                        Text("Fibre:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $fibers)
                            .numbersOnly($fibers, includeDecimal: true)
                    }
                    HStack {
                        Text("Carbohidrați:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $carbs)
                            .numbersOnly($carbs, includeDecimal: true)
                    }
                }
                // RECIPE INGREDIENTS
                Section(header: Text("Ingrediente:")) {
                    TextEditor(text: $ingredients)
                        .frame(height: 150, alignment: .leading)
                }
                // RECIPE DIRECTIONS
                Section(header: Text("Mod preparare:")) {
                    TextEditor(text: $description)
                        .frame(height: 150, alignment: .leading)
                }
                // RECIPE IMAGE
                Section(header: Text("Poză preparat:")) {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        if let profileImage = recipeImage {    // an image was picked
                            profileImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
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
            .navigationTitle("Adauga o reteta")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear{
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    self.viewModel.uploadRecipe(title: title, time_minutes: Int(time_minutes)!, category: selectedCategory, description: description, ingredients: ingredients, calories: calories , protein: protein, carbs: carbs, fibers: fibers, fat: fat)
                }
            }
        } //: END ZSTACK
    }
}


// MARK: - EXTENSIONS
extension AddNewRecipe {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
}


// MARK: - PREVIEWS
struct AddNewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddNewRecipe()
            }
            NavigationView {
                AddNewRecipe()
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
