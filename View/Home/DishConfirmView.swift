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
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var dishConfirmViewModel: DishConfirmViewModel
    
    @State private var data = Date()
    @State private var ammount = "100"
    @State private var showDeleteConfirmation = false
    
    var dishType: Int
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            if let user = authViewModel.currentUser {
                if let dishData = dishConfirmViewModel.dish {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            // Header
                            VStack {
                                HStack {
                                    Text(dishData.title)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            
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
                            
                            if !dishData.estimates.isEmpty {
                                Text("Estimări: \(dishData.estimates)")
                                    .font(.footnote)
                                    .foregroundColor(Color.formText)
                                    .padding([.leading, .bottom, .trailing])
                                    .padding(.leading, 8)
                                    .padding(.top, -2)
                            }
                            
                            NutritionChart(chartTitle: "Valori nutriționale",
                                           protein: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.protein),
                                           carbs: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.carbs),
                                           fat: ammount.isEmpty ? 1 : calculateAmmount(grams: Double(ammount) ?? 0, nutrition: dishData.fat),
                                           isDisabled: ammount.isEmpty ? true : false)
                            
                            // Add to journal
                            Button {
                                // viewModel.login(withEmail: email, password: password)
                            } label: {
                                RectangleButton(text: "Adaugă la jurnal")
                            }
                            
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
                DishConfirmView(dishConfirmViewModel: viewModel, dishType: 1)
            }
            NavigationView {
                DishConfirmView(dishConfirmViewModel: viewModel, dishType: 1)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
