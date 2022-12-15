//
//  AddNewRecipe.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/9/22.
//

import SwiftUI

struct AddNewRecipe: View {
    // MARK: - PROPERTIES
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    @State private var titlu = ""
    @State private var descriere = ""
    @State private var ingrediente = ""
    @State private var preparare = ""
    @State private var categorie = "" // de facut field
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Form(content: {
                Section(header: Text("Titlu rețetă:")) {
                   TextField("", text: $titlu)
                }
                Section(header: Text("Descriere:")) {
                    TextEditor(text: $descriere)
                        .frame(height: 150, alignment: .leading)
                }
                Section(header: Text("Ingrediente:")) {
                    TextEditor( text: $ingrediente)
                        .frame(height: 150, alignment: .leading)
                }
                Section(header: Text("Mod preparare:")) {
                    TextEditor( text: $preparare)
                        .frame(height: 150, alignment: .leading)
                }
                Section(header: Text("Poza preparat:")) {
                    Button {
                        showImagePicker.toggle()
                        print("buton imagine apasat ")
                    } label: {
                        if let profileImage = recipeImage {    // daca s-a ales o imagine din galeria telefonului creaza constanta si executa ..
                            profileImage
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            Text("Adauga o imagine")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                }
            })
            .navigationTitle("Adauga o reteta")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Trimite") {
                    print("reteta trimisa")
                }
            }
        }
    }
    // MARK: - loadImage()
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
}

// MARK: - PREVIEWS
struct AddNewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipe()
    }
}
