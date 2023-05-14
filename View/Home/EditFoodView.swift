//
//  EditFoodViewModel.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12.05.2023.
//

import SwiftUI
import KeyboardToolbars

struct EditFoodView: View {
    // MARK: - PROPERTIES
    @StateObject var editFoodViewModel = EditFoodViewModel()
    
    @State private var title: String
    @State private var calories: String
    @State private var carbs: String
    @State private var fibers: String
    @State private var fat: String
    @State private var protein: String
    @State private var estimates: String

    let foodId: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    init(food: Food) {
        UITableView.appearance().showsVerticalScrollIndicator = false
        
        _title = State(initialValue: food.title)
        _calories = State(initialValue: String(food.calories))
        _carbs = State(initialValue: String(food.carbs))
        _fibers = State(initialValue: String(food.fibers))
        _fat = State(initialValue: String(food.fat))
        _protein = State(initialValue: String(food.protein))
        _estimates = State(initialValue: String(food.estimates))
        
        self.foodId = food.id
    }

    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Form {
                // Title
                Section(header: Text("Titlu mâncare:")) {
                    TextField("Arahide", text: $title)
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
                
                // Estimates
                Section(header: Text("Estimări: ")) {
                    TextField("1 punga = 200g", text: $estimates)
                }
            } //: END FORM
            .frame(maxWidth: 580)
            .navigationTitle("Editează felul de mâncare")
            .navigationBarTitleDisplayMode(.inline)
            .addHideKeyboardButton()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                Button("Trimite") {
                    Task(priority: .medium) {
                        try await self.editFoodViewModel.updateFood(id: foodId, title: title, calories: calories, carbs: carbs, fibers: fibers, fat: fat, protein: protein, estimates: estimates)
                    }
                }
            }
            .onReceive(editFoodViewModel.$didUpdateFood, perform: { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct EditFoodView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                EditFoodView(food: dishDetailPreviewData)
            }
            NavigationView {
                EditFoodView(food: dishDetailPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
