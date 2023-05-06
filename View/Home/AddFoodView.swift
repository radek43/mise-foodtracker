//
//  AddFoodView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 04.05.2023.
//

import SwiftUI
import KeyboardToolbars

struct AddFoodView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel = AddFoodViewModel()
    
    @State private var title = ""
    @State private var met = ""
    @State private var ingredients = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fibers = ""
    @State private var fat = ""
    @State private var estimates = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // Title
                Section(header: Text("Titlu:")) {
                    TextField("Baton de ciocolată", text: $title)
                }
                // Recipe meta
                Section(header: Text("Valori nutritive/100g: ")) {
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
                // Estimates
                Section(header: Text("Estimări:")) {
                    TextField("1 baton = 51g", text: $estimates)
                }
            }
            .frame(maxWidth: 580)
            .navigationTitle("Adaugă un fel de mâncare")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await self.viewModel.postFood(title: title, calories: calories, carbs: carbs, fibers: fibers, fat: fat, protein: protein, estimates: estimates)
                    }
                }
            }
            .onReceive(viewModel.$didUploadFood, perform: { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

// MARK: - PREVIEW
struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddFoodView()
            }
            NavigationView {
                AddFoodView()
            }
            .preferredColorScheme(.dark)
        }
    }
}

