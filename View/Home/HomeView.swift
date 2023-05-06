//
//  HomeView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 11.04.2022.
//

import SwiftUI
import SwiftUICharts


struct HomeView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Binding var tabSelection: Int
    
    @State private var data = Date()
    @State private var showDishSheet = false
    
    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Color.background
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            // Date picker
                            VStack(alignment: .center) {
                                DatePicker(selection: $data, in: ...Date(), displayedComponents: .date) {
                                    Text("Data")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                }
                                .accentColor(.primary)
                            }
                            .card()
                            
                            // Objective dashboard
                            VStack(alignment: .center) {
                                HStack {
                                    Text("Obiectiv")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(user.calorie_goal) kCal")
                                        .font(.body)
                                        .fontWeight(.semibold)
                                }
                                HStack {
                                    Spacer()
                                    Text("2342 kCal Rămase")
                                        .fontWeight(.semibold)
                                        .padding(5)
                                    Spacer()
                                }
                                ProgressView(value: 0.25)
                                
                                HStack(alignment: .center) {
                                    VStack {
                                        Text("0")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        Text("Consumat")
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    VStack(alignment: .center) {
                                        Text("0")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        Text("Ars")
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    VStack(alignment: .center) {
                                        Text("0")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        Text("Net")
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                                .fixedSize(horizontal: false, vertical: true)
                            }
                            .card()
                            
                            // Add data to log
                            VStack(alignment: .center) {
                                HStack {
                                    Text("Jurnal")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                
                                HStack(alignment: .top) {
                                    NavigationLink {
                                        DishListView()
                                    } label: {
                                        DishButton(imageName: "breakfast", title: "mic\ndejun")
                                    }
                                    
                                    NavigationLink {
                                        DishListView()
                                    } label: {
                                        DishButton(imageName: "soupLadle", title: "prânz")
                                    }
                                    // DishRingButton()
                                    NavigationLink {
                                        DishListView()
                                    } label: {
                                        DishButton(imageName: "pastaDish", title: "cină")
                                    }
                                    NavigationLink {
                                        DishListView()
                                    } label: {
                                        DishButton(imageName: "icecream", title: "gustări")
                                    }
                                }
                                
                                HStack(alignment: .top) {
                                    Button {
                                        tabSelection = 3
                                    } label: {
                                        DishButton(imageName: "sport", title: "activitate")
                                    }
                                    Button {
                                        print("Buton greutate apasat")
                                    } label: {
                                        DishButton(imageName: "weightScale", title: "greutate")
                                    }
                                    Button {
                                        print("Buton lichide apasat")
                                    } label: {
                                        DishButton(imageName: "waterDrop", title: "apă ")
                                    }
                                }
                            }
                            .card()
                            
                            NutritionFactsChart()
                                .padding(.bottom, 20)
                            
                        }
                        .navigationTitle("Bine ai venit!")
                        .navigationBarItems(
                            leading: user.is_staff == true ?
                                NavigationLink {
                                    AddFoodView()
                                } label: {
                                    Image(systemName: "square.and.pencil")
                                } : nil,
                            trailing:
                                NavigationLink {
                                    SettingsView()
                                } label: {
                                    Image(systemName: "gearshape")
                                }
                        )
                    }
                }
                .background(Color.background.edgesIgnoringSafeArea(.all))
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            HomeView(tabSelection: .constant(1))
            HomeView(tabSelection: .constant(1))
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
