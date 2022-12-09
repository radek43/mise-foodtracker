//
//  AddRecipeView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/9/22.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var recipeImage: Image?
    
    @State private var titlu = ""
    @State private var descriere = ""
    @State private var ingrediente = ""
    @State private var preparare = ""
    @State private var categorie = "" // de facut field
    
    var body: some View {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Titlu rețetă:")
                        
                        TextField("", text: $titlu)
                            .textFieldStyle(.roundedBorder)
                        
                        Text("Descriere:")
                        TextEditor( text: $descriere)
                            .frame(height: 150, alignment: .leading)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary).opacity(0.15))
                        
                        Text("Ingrediente:")
                        TextEditor( text: $ingrediente)
                            .frame(height: 150, alignment: .leading)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary).opacity(0.15))
                        
                        Text("Mod preparare:")
                        TextEditor( text: $preparare)
                            .frame(height: 150, alignment: .leading)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary).opacity(0.15))
                        
                        Button {
                            showImagePicker.toggle()
                            print("buton de ales imagine apasat")
                        } label: {
                            if let profileImage = recipeImage {    // daca s-a ales o imagine din galeria telefonului creaza constanta si executa ..
                                profileImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            } else {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .frame(height: 200)
                                    .foregroundColor(Color.white)
                                    .overlay(RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.secondary)
                                                .opacity(0.15))
                                    .overlay(
                                        VStack {
                                                Image("addPhotoOutline")
                                                    .resizable()
                                                    .frame(width: 112, height: 100)
                                                    .foregroundColor(Color.secondary)
                                        
                                                Text("Adaugă o imagine")
                                                    .foregroundColor(Color.secondary)
                                                }
                                            )
                            }
                        }
                        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                            ImagePicker(selectedImage: $selectedImage)
                        }
                        
                        Button {
                            print("trimite rețetă")
                        } label: {
                            Text("Trimite rețetă")
                        }

        //                    .onTapGesture {
        //                        firestoreManager.createDish(dishName: titlu, dishDescription: descriere, dishIngredients: ingrediente, dishDirections: preparare)
        //                    }
                    }
                    .navigationTitle("Adaugă o retetă nouă")
                    .padding()
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        recipeImage = Image(uiImage: selectedImage)
    }
    
}



struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
