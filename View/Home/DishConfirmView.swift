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
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
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
                        .padding(.horizontal)
                        .padding(.top)
                        
                        VStack(alignment: .center) {
                            DatePicker(selection: $data, in: ...Date(), displayedComponents: .date) {
                                Text("Data consumării:")
                                    .foregroundColor(Color.formText)
                            }
                            .accentColor(.primary)
                        }
                        .card()

                        HStack {
                            Text("Cantitate(g):")
                                .foregroundColor(Color.formText)
                            TextField("", text: $ammount)
                                .numbersOnly($ammount, includeDecimal: true, decimalPlaces: 2)
                        }
                        .card()
                        
                        NutritionFactsChart(chartTitle: "Valori nutriționale:")
                        
                        // Add to journal
                        Button {
                            // viewModel.login(withEmail: email, password: password)
                        } label: {
                            RectangleButton(text: "Adaugă la jurnal")
                        }
                        
                        Spacer()
                    }
                    .navigationBarTitle("Detalii Servire", displayMode: .inline)
                }
                .addHideKeyboardButton()
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
                DishConfirmView(dishConfirmViewModel: viewModel)
            }
            NavigationView {
                DishConfirmView(dishConfirmViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
