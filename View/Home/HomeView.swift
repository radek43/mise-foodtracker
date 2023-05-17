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
    @State private var selectedDate = Date().stripTime()
    @State var isActive: Bool = false
    
    private var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    var filteredLogs: [Log] {
        logViewModel.logs.filter {
            Calendar.current.compare($0.dateTime, to: selectedDate, toGranularity: .day) == .orderedSame
        }
    }
    var defaultLog: Log {
        Log(dateTime: selectedDate)
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
                            .onChange(of: selectedDate, perform: { value in
                                let newDate = selectedDate.stripTime()
                                selectedDate = newDate
                            })
                            .accentColor(.primary)
                            .card()
                            
                            // Objective dashboard
                            VStack(alignment: .center) {
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
                                
                                ConsumedCalories(totalCalories: filteredLogs.isEmpty ? 0 : filteredLogs[0].totalCalories, totalActivityCalories: filteredLogs.isEmpty ? 0 : filteredLogs[0].totalActivityCalories)
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
                                
                                HStack(alignment: .top, spacing: idiom == .pad ? 30 : 5) {
                                    NavigationLink {
                                        DishListView(dishType: 1)
                                    } label: {
                                        if calorieCategoryExists(1) == true {
                                            DishRingButton(title: "mic\ndejun", calories: filteredLogs[0].totalBreakfast)
                                        } else {
                                            DishButton(imageName: "breakfast", title: "mic\ndejun")
                                        }
                                    }
                                    NavigationLink {
                                        DishListView(dishType: 2)
                                    } label: {
                                        if calorieCategoryExists(2) == true {
                                            DishRingButton(title: "prânz", calories: filteredLogs[0].totalLunch)
                                        } else {
                                            DishButton(imageName: "soupLadle", title: "prânz")
                                        }
                                    }
                                    NavigationLink {
                                        DishListView(dishType: 3)
                                    } label: {
                                        if calorieCategoryExists(3) == true {
                                            DishRingButton(title: "cină", calories: filteredLogs[0].totalDinner)
                                        } else {
                                            DishButton(imageName: "pastaDish", title: "cină")
                                        }
                                    }
                                    NavigationLink {
                                        DishListView(dishType: 4)
                                    } label: {
                                        if calorieCategoryExists(4) == true {
                                            DishRingButton(title: "gustări", calories: filteredLogs[0].totalSnacks)
                                        } else {
                                            DishButton(imageName: "icecream", title: "gustări")
                                        }
                                    }
                                }
                                
                                HStack(alignment: .top, spacing: idiom == .pad ? 30 : 5) {
                                    Button {
                                        tabSelection = 3
                                    } label: {
                                        if filteredLogs.isEmpty || filteredLogs[0].activities.isEmpty {
                                            DishButton(imageName: "sport", title: "activitate")
                                        } else {
                                            DishRingButton(title: "sport", calories: filteredLogs[0].totalActivityCalories)
                                        }
                                    }
                                    Button {
                                        print("Buton greutate apasat")
                                    } label: {
                                        DishButton(imageName: "weightScale", title: "greutate")
                                    }
                                    NavigationLink {
                                        AddWaterView()
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
    
    func calorieCategoryExists(_ category: Int) -> Bool {
        if filteredLogs.isEmpty {
            return false
        } else {
            for food in filteredLogs[0].foods {
                if food.mealtype == category {
                    return true
                }
            }
        }
        return false
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
