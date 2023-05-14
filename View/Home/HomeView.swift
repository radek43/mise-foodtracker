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
    @EnvironmentObject var logViewModel: LogViewModel
    
    @Binding var tabSelection: Int
    
    @State private var showDishSheet = false
    @State private var selectedDate = Date()

    var filteredLogs: [Log] {
        logViewModel.logs.filter {
            Calendar.current.compare($0.id, to: selectedDate, toGranularity: .day) == .orderedSame
        }
    }
    var defaultLog: Log {
        Log(id: selectedDate)
    }
    
    
    
    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Color.background
                            .edgesIgnoringSafeArea(.all)
                        
                        // Date picker
                        VStack(alignment: .center) {
                            DatePicker(selection: $selectedDate, in: ...Date(), displayedComponents: .date) {
                                Text("Data")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .onChange(of: selectedDate) { newDate in
                                if let midnight = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: newDate) {
                                    selectedDate = midnight

                                }
                            }
                            .accentColor(.primary)
                            .card()
                            
                            // Objective dashboard
                            VStack(alignment: .leading) {
                                HStack(alignment: .center) {
                                    Text("Obiectiv")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text("\(user.calorie_goal, specifier: "%.f") kCal")
                                        .font(.body)
                                        .fontWeight(.semibold)
                                }
                                HStack(alignment: .center) {
                                    Spacer()
                                    Text("\(filteredLogs.isEmpty ? user.calorie_goal : user.calorie_goal - filteredLogs[0].totalCalories, specifier: "%.f") kCal Rămase")
                                        .fontWeight(.semibold)
                                        .padding(5)
                                    Spacer()
                                }
                                ProgressView(value: filteredLogs.isEmpty ? 0 : filteredLogs[0].totalCalories / user.calorie_goal)
                                
                                HStack(alignment: .center) {
                                    VStack {
                                        Text("\(filteredLogs.isEmpty ? 0 : filteredLogs[0].totalCalories, specifier: "%.f")")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        Text("Consumat")
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    VStack(alignment: .center) {
                                        Text("\(filteredLogs.isEmpty ? 0 : filteredLogs[0].totalActivityCalories, specifier: "%.f")")
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        Text("Ars")
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    VStack(alignment: .center) {
                                        Text("\(filteredLogs.isEmpty ? 0 :  filteredLogs[0].totalCalories - filteredLogs[0].totalActivityCalories, specifier: "%.f")")
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
                                        DishListView(dishType: 1)
                                    } label: {
                                        DishButton(imageName: "breakfast", title: "mic\ndejun")
                                    }
                                    NavigationLink {
                                        DishListView(dishType: 2)
                                    } label: {
                                        DishButton(imageName: "soupLadle", title: "prânz")
                                    }
                                    // DishRingButton()
                                    NavigationLink {
                                        DishListView(dishType: 3)
                                    } label: {
                                        DishButton(imageName: "pastaDish", title: "cină")
                                    }
                                    NavigationLink {
                                        DishListView(dishType: 4)
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
                            NutritionChart(chartTitle: "Valori nutriționale",
                                           protein: filteredLogs.isEmpty ? 1 : filteredLogs[0].totalProtein,
                                           carbs: filteredLogs.isEmpty ? 1 : filteredLogs[0].totalCarbs,
                                           fat: filteredLogs.isEmpty ? 1 : filteredLogs[0].totalFat,
                                           isDisabled: filteredLogs.isEmpty ? true : false)
                            Spacer()
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
        .environmentObject(LogViewModel())
    }
}
