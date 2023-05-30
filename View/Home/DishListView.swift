//
//  DishListView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.01.2023.
//

import SwiftUI

struct DishListView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel
    
    @StateObject var dishViewModel = DishViewModel()
    
    let dishType: Int
    let date: Date
    
    @State private var isHitTestEnabled = false
    
    var filteredLogs: [Log] {
        logViewModel.logs.filter {
            Calendar.current.compare($0.dateTime, to: date, toGranularity: .day) == .orderedSame
        }
    }
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    // Refresh list
                    RefreshControl(coordinateSpace: .named("RefreshControl")) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            dishViewModel.loadDishes()
                        }
                    }
                    
                    VStack(spacing: 60.0) {
                        // Recent logs
                        if !filteredLogs.isEmpty {
                            VStack(alignment: .leading) {
                                Text("ADĂUGATE RECENT:")
                                    .font(.footnote)
                                    .foregroundColor(Color.formText)
                                    .padding(.horizontal, 24)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Denumire")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("kCal")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                    }
                                    Divider()
                                    ForEach(filteredLogs[0].foods) { log in
                                        if log.mealtype == dishType {
                                            NavigationLink {
                                                DishEdit(dish: log, ammount: log.servingSize)
                                            } label: {
                                                HStack {
                                                    Text(log.title)
                                                        .foregroundColor(Color(UIColor.label))
                                                        .fixedSize(horizontal: false, vertical: true)
                                                    Spacer()
                                                    Text("\(log.calories, specifier: "%.f")")
                                                        .foregroundColor(Color(UIColor.label))
                                                    Image(systemName: "chevron.right")
                                                }
                                            }
                                            if log.id != filteredLogs[0].foods.last?.id {
                                                Divider()
                                            }
                                        }
                                    }
                                }
                                .card()
                            }
                            .padding(.top)
                        }
                        
                        // Activity list
                        VStack(alignment: .leading) {
                            Text("FELURI DE MÂNCARE:")
                                .font(.footnote)
                                .foregroundColor(Color.formText)
                                .padding(.horizontal, 24)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Denumire")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("kCal")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                                Divider()
                                ForEach(dishViewModel.dishes) { dishes in
                                    NavigationLink {
                                        DishConfirmView(date: date, dishtype: dishType, dishConfirmViewModel: DishConfirmViewModel(withDishId: dishes.id))
                                    } label: {
                                        HStack {
                                            Text(dishes.title)
                                                .foregroundColor(Color(UIColor.label))
                                                .fixedSize(horizontal: false, vertical: true)
                                            Spacer()
                                            Text("\(dishes.calories, specifier: "%.f")")
                                                .foregroundColor(Color(UIColor.label))
                                            Image(systemName: "chevron.right")
                                        }
                                    }
                                    if dishes.id != dishViewModel.dishes.last?.id {
                                        Divider()
                                    }
                                }
                                .allowsHitTesting(isHitTestEnabled)
                            }
                            .card()
                            .padding(.bottom)
                            .onAppear {
                                dishViewModel.loadDishes()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    isHitTestEnabled = true
                                }
                            }
                            .frame(maxWidth: 580)
                            .navigationTitle("Adaugă la jurnal")
                        .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
                .background(Color.background.edgesIgnoringSafeArea(.all))
                .coordinateSpace(name: "RefreshControl")
            }
        }
    }
}


// MARK: - PREVIEWS
struct DishListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        let dishViewModel = DishViewModel()
        dishViewModel.dishes = dishPreviewData
        let logViewModel = LogViewModel()
        logViewModel.logs = logPreviewData
        return Group {
            NavigationView {
                DishListView(dishViewModel: dishViewModel, dishType: 1, date: Date().stripTime())
            }
            NavigationView {
                DishListView(dishViewModel: dishViewModel, dishType: 1, date: Date().stripTime())
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
        .environmentObject(logViewModel)
    }
}
