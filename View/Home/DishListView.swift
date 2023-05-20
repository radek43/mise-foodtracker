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
    
    @StateObject var dishViewModel = DishViewModel()
    
    @State private var showEditView = false
    @State private var showActivityConfirmSheet = false
    @State private var showInfoSheet = false
    
    let dishType: Int
    let date: Date
    
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
                    VStack {
                        // Search bar
                        SearchBar(placeholderText: "Caută un fel de mâncare",text: .constant(""))
                            .frame(maxWidth: 580)
                            .padding([.top, .horizontal])
                            .padding(.bottom, 5.0)
        
                        // Activity list
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
                                    }
                                }
                                if dishes.id != dishViewModel.dishes.last?.id {
                                    Divider()
                                }
                            }
                        }
                        
                        .card()
                        .padding(.bottom)
                        .onAppear {
                            dishViewModel.loadDishes()
                        }
                        .frame(maxWidth: 580)
                        .navigationTitle("Adaugă la jurnal")
                        .navigationBarTitleDisplayMode(.inline)
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
    }
}
