//
//  RecipeConfirmView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.05.2023.
//

import SwiftUI
import KeyboardToolbars


struct RecipeConfirmView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var logViewModel: LogViewModel
    
    private let options = ["Mic dejun", "Prânz", "Cină", "Gustare"]
    
    @State private var data = Date().stripTime()
    @State private var ammount = "100"
    @State private var selectedOption = 0
    
    var recipe: Food
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    // Header
                    VStack {
                        HStack {
                            Text(recipe.title)
                                .font(.title)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: 580)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Picker("", selection: $selectedOption) {
                        ForEach(0..<options.count, id: \.self) { index in
                            Text(options[index])
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    VStack(alignment: .center) {
                        DatePicker(selection: $data, in: ...Date(), displayedComponents: .date) {
                            Text("Data consumării:")
                                .foregroundColor(Color.formText)
                        }
                        .onChange(of: data) { newDate in
                            if let midnight = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: newDate) {
                                data = midnight
                                
                            }
                        }
                        .accentColor(.primary)
                    }
                    .card()
                    
                    HStack {
                        Text("Cantitate(g):")
                            .foregroundColor(Color.formText)
                        TextField("", text: $ammount)
                            .numbersOnly($ammount, includeDecimal: true, decimalPlaces: 2, disableZero: true)
                    }
                    .card()
                    
                    if !recipe.estimates.isEmpty {
                        HStack {
                            Text("Estimări: \(recipe.estimates)")
                                .font(.footnote)
                                .foregroundColor(Color.formText)
                            Spacer()
                        }
                        .frame(maxWidth: 580)
                        .padding([.leading, .bottom, .trailing])
                        .padding(.leading, 8)
                        .padding(.top, -2)
                    }
                    
                    HStack {
                        Text("\(calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.calories), specifier: "%.0f") calorii consumate")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal, 32)
                    
                    NutritionChart(chartTitle: "Valori nutriționale",
                                   protein: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.protein),
                                   carbs: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.carbs),
                                   fat: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.fat),
                                   isDisabled: ammount.isEmpty ? true : false)
                    
                    // Add to journal
                    Button {
                        logViewModel.addDishToLog(date: data, dish: DishLog(mealtype: selectedOption + 1, title: recipe.title, servingSize: Double(ammount) ?? 0, calories: calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.calories), protein: calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.protein), carbs: calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.carbs), fibers: calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.fibers), fat: calculateAmmount(grams: Double(ammount) ?? 0, nutrition: recipe.fat))) {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    } label: {
                        RectangleButton(text: "Adaugă la jurnal", isDisabled: ammount.isEmpty ? true : false)
                    }
                    .disabled(ammount.isEmpty)
                    
                    Spacer()
                }
                .navigationBarTitle("Detalii Servire", displayMode: .inline)
            }
            .addHideKeyboardButton()
        }
    }
    
    // MARK: - FUNCTIONS
    func calculateAmmount(grams: Double, nutrition: Double) -> Double {
        let result = grams * nutrition / 100
        return result.rounded(toPlaces: 1)
    }
}

// MARK: - PREIVEWS
struct RecipeConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeConfirmView(recipe: dishDetailPreviewData)
            RecipeConfirmView(recipe: dishDetailPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
