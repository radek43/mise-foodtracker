//
//  DishConfirmView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.01.2023.
//

import SwiftUI
import KeyboardToolbars


struct DishConfirmView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var dishConfirmViewModel: DishConfirmViewModel
    
    var dishType: Int
    
    @State private var data: Date
    @State private var ammount = "100"
    @State private var showDeleteConfirmation = false
    
    init(date: Date, dishtype: Int, dishConfirmViewModel: DishConfirmViewModel) {
        _data = State(initialValue: date)
        self.dishConfirmViewModel = dishConfirmViewModel
        self.dishType = dishtype
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            if let user = authViewModel.currentUser {
                if let dishData = dishConfirmViewModel.dish {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center) {
                            // Header
                            VStack {
                                HStack {
                                    Text(dishData.title)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: 580)
                            .padding(.horizontal)
                            .padding(.top)
                            
                            VStack(alignment: .center) {
                                DatePicker(selection: $data, in: ...Date(), displayedComponents: .date) {
                                    Text("Data consumării:")
                                        .foregroundColor(Color.formText)
                                }
                                .onChange(of: data, perform: { value in
                                    let newDate = data.stripTime()
                                    data = newDate
                                })
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
                            
                            if !dishData.estimates.isEmpty {
                                HStack {
                                    Text("Estimări: \(dishData.estimates)")
                                        .font(.footnote)
                                        .foregroundColor(Color.formText)
                                    Spacer()
                                }
                                .frame(maxWidth: 580)
                                .padding([.leading, .bottom, .trailing])
                                .padding(.leading, 16)
                                .padding(.top, -2)
                            }
                            
                            HStack {
                                Text("\(calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.calories), specifier: "%.0f") calorii consumate")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.top)
                            .padding(.horizontal, 32)
                            
                            NutritionChart(chartTitle: "Valori nutriționale",
                                           protein: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.protein),
                                           carbs: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.carbs),
                                           fat: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.fat),
                                           isDisabled: ammount.isEmpty ? true : false)
                            
                            // Add to journal
                            Button {
                                logViewModel.addDishToLog(date: data, dish: DishLog(mealtype: dishType, title: dishData.title, servingSize: Double(ammount)!, calories: calculateAmmount(grams: Double(ammount)!, nutrition: dishData.calories), protein: calculateAmmount(grams: Double(ammount)!, nutrition: dishData.protein), carbs: calculateAmmount(grams: Double(ammount)!, nutrition: dishData.carbs), fibers: calculateAmmount(grams: Double(ammount)!, nutrition: dishData.fibers), fat: calculateAmmount(grams: Double(ammount)!, nutrition: dishData.fat))) {
                                        NavigationUtil.popToRootView()
                                }
                            } label: {
                                RectangleButton(text: "Adaugă la jurnal", isDisabled: ammount.isEmpty ? true : false)
                            }
                            .disabled(ammount.isEmpty)
                            
                            Spacer()
                        }
                        .navigationBarItems(trailing: user.is_staff == true ?
                            HStack(spacing: 15) {
                                NavigationLink {
                                    EditFoodView(food: dishData)
                                } label: {
                                    HStack {
                                        Text("Editează")
                                        Image(systemName: "highlighter")
                                    }
                                }
                                Button {
                                     showDeleteConfirmation.toggle()
                                } label: {
                                    HStack {
                                        Text("Șterge")
                                            .foregroundColor(Color.red)
                                        Image(systemName: "trash")
                                            .foregroundColor(Color.red)
                                    }
                                }
                                .alert(isPresented:$showDeleteConfirmation) {
                                    Alert(
                                        title: Text("Ești sigur că vrei să ștergi această rețetă?"),
                                        message: Text("Această acțiune este permanentă"),
                                        primaryButton: .destructive(Text("Șterge")) {
                                            Task {
                                                try await dishConfirmViewModel.deleteDish()
                                            }
                                            self.presentationMode.wrappedValue.dismiss()
                                        },
                                        secondaryButton: .cancel(Text("Renunță"))
                                    )
                                }
                            }
                            : nil
                        )
                        .navigationBarTitle(user.is_staff == true ? "" : "Detalii Servire", displayMode: .inline)
                    }
                    .addHideKeyboardButton()
                }
            }
        }
        .onAppear {
            Task(priority: .medium) {
                try await self.dishConfirmViewModel.fetchDish()
            }
        }
    }
    
    func calculateAmmount(grams: Double, nutrition: Double) -> Double {
        let result = grams * nutrition / 100
        return result.rounded(toPlaces: 1)
    }
}


// MARK: - PREVIEWS
struct DishConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        let viewModel = DishConfirmViewModel(withDishId: 1)
        viewModel.dish = dishDetailPreviewData
        return Group {
            NavigationView {
                DishConfirmView(date: Date().stripTime(), dishtype: 1, dishConfirmViewModel: viewModel)
            }
            NavigationView {
                DishConfirmView(date: Date().stripTime(), dishtype: 1, dishConfirmViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
