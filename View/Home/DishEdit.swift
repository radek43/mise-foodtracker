//
//  DishEdit.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 22.05.2023.
//

import SwiftUI

struct DishEdit: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var dish: DishLog
    
    @State private var ammount: String
    @State private var showDeleteConfirmation = false
    
    init(dish: DishLog, ammount: Double) {
        self.dish = dish
        _ammount = State(initialValue: String(ammount))
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Text("\(dish.title)")
                                .font(.title)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: 580)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        Text("Cantitate(g):")
                            .foregroundColor(Color.formText)
                        TextField("", text: $ammount)
                            .numbersOnly($ammount, includeDecimal: true, decimalPlaces: 2, disableZero: true)
                    }
                    .card()
                    
                    HStack {
                        Text("\(calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.calories), specifier: "%.0f") calorii consumate")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal, 32)
                    
                    NutritionChart(chartTitle: "Valori nutriționale",
                                   protein: ammount.isEmpty ? 1 : calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.protein),
                                   carbs: ammount.isEmpty ? 1 : calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.carbs),
                                   fat: ammount.isEmpty ? 1 : calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.fat),
                                   isDisabled: ammount.isEmpty ? true : false)
                    
                    // Add to journal
                    Button {
                        logViewModel.editDish(id: dish.id, mealtype: dish.mealtype, title: dish.title, servingSize: Double(ammount)!, calories: calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.calories), protein: calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.protein), carbs: calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.carbs), fibers: calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.fibers), fat: calculateAmmount(oldAmmount: dish.servingSize , newAmmount: Double(ammount) ?? 0, nutrition: dish.fat)) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        RectangleButton(text: "Modifică fel de mâncare", isDisabled: ammount.isEmpty ? true : false)
                    }
                    .disabled(ammount.isEmpty)
                    
                    Spacer()

                }
                .navigationBarItems(trailing:
                        Button {
                             showDeleteConfirmation.toggle()
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(Color.red)
                        }
                        .alert(isPresented:$showDeleteConfirmation) {
                            Alert(
                                title: Text("Ești sigur că vrei să ștergi această mâncare?"),
                                message: Text("Această acțiune este permanentă"),
                                primaryButton: .destructive(Text("Șterge")) {
                                    logViewModel.deleteDish(id: dish.id) {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                },
                                secondaryButton: .cancel(Text("Renunță"))
                            )
                        }
                )
                .navigationBarTitle("Editare jurnal", displayMode: .inline)
            }
        }
    }
    
    func calculateAmmount(oldAmmount: Double, newAmmount: Double, nutrition: Double) -> Double {
        let ratio = newAmmount / oldAmmount
        let result = nutrition * ratio
        return result.rounded(toPlaces: 1)
    }
    
}

// MARK: - PREVIEW
struct DishEdit_Previews: PreviewProvider {
    static var previews: some View {
        let logViewModel = LogViewModel()
        logViewModel.logs = logPreviewData
        return Group {
            NavigationView {
                DishEdit(dish: logPreviewData[0].foods[0], ammount: logPreviewData[0].foods[0].servingSize)
            }
            NavigationView {
                DishEdit(dish: logPreviewData[0].foods[0], ammount: logPreviewData[0].foods[0].servingSize)
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(logViewModel)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
