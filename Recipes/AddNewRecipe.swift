//
//  AddNewRecipe.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/9/22.
//

import SwiftUI
import Combine
import KeyboardToolbars

struct AddNewRecipe: View {
    // MARK: - PROPERTIES    
    @State private var title = ""
    @State private var description = ""
    @State private var ingredients = ""
    @State private var category = "" // de facut field
    @State private var calories = ""
    @State private var protein: Decimal = 0
    @State private var carbs = ""
    @State private var fibers = ""
    @State private var fat = ""
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Form(content: {
                Section(header: Text("Titlu rețetă:")) {
                   TextField("", text: $title)
                }
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
                        TextField("", value: $calories, formatter: formatter)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Grasimi:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $fat)
                            .keyboardType(.decimalPad)
                            .onReceive(Just(fat)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.fat = filtered
                                }
                        }
                    }
                    HStack {
                        Text("Fibre:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $fibers)
                            .keyboardType(.decimalPad)
                            .onReceive(Just(fibers)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.fibers = filtered
                                }
                        }
                    }
                    HStack {
                        Text("Carbohidrati:")
                            .foregroundColor(Color.formText)
                        TextField("", text: $carbs)
                            .keyboardType(.decimalPad)
                            .onReceive(Just(carbs)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.carbs = filtered
                                }
                        }
                    }
                }
                Section(header: Text("Ingrediente:")) {
                    TextEditor(text: $ingredients)
                        .frame(height: 150, alignment: .leading)
                }
                Section(header: Text("Mod preparare:")) {
                    TextEditor(text: $description)
                        .frame(height: 150, alignment: .leading)
                }
//                Section(header: Text("Poza preparat:")) {
//                    Button {
//                        showImagePicker.toggle()
//                        print("buton imagine apasat ")
//                    } label: {
//                        if let profileImage = recipeImage {    // daca s-a ales o imagine din galeria telefonului creaza constanta si executa ..
//                            profileImage
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .clipShape(RoundedRectangle(cornerRadius: 8))
//                        } else {
//                            Text("Adauga o imagine")
//                                .frame(maxWidth: .infinity, alignment: .center)
//                        }
//                    }
//                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
//                        ImagePicker(selectedImage: $selectedImage)
//                    }
//                }
            })
            .navigationTitle("Adauga o reteta")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear{
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    print("reteta trimisa")
                }
            }
        }
    }
    // MARK: - FUNCTIONS
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
}

// MARK: - PREVIEWS
struct AddNewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddNewRecipe()
            AddNewRecipe()
                .preferredColorScheme(.dark)
        }
    }
}
