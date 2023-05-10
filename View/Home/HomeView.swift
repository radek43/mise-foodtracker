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
    
    @State private var showDishSheet = false
    @State private var selectedDate = Date()
    
    var logs: [Log] = [
        Log(id: Date.from(year: 2023, month: 5, day: 7),
            foods: [
                DishLog(mealtype: 1,
                        title: "Cartofi prajiti",
                        servingSize: 100,
                        calories: 150,
                        protein: 14,
                        carbs: 31,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Ciorbă de cartofi",
                        servingSize: 100,
                        calories: 350,
                        protein: 44,
                        carbs: 23,
                        fibers: 0,
                        fat: 11),
                DishLog(mealtype: 1,
                        title: "Cereale cu lapte",
                        servingSize: 100,
                        calories: 420,
                        protein: 32,
                        carbs: 47,
                        fibers: 0,
                        fat: 15)
            ],
            activities: [
                ActivityLog(title: "Alergare", calories: 48),
                ActivityLog(title: "Haltere", calories: 23),
                ActivityLog(title: "Plimbare", calories: 12)
            ],
            weight: 50,
            water: 6),
        
        Log(id: Date.from(year: 2023, month: 5, day: 8),
            foods: [
                DishLog(mealtype: 1,
                        title: "Pepene roșu",
                        servingSize: 100,
                        calories: 250,
                        protein: 64,
                        carbs: 13,
                        fibers: 0,
                        fat: 21),
                DishLog(mealtype: 1,
                        title: "Căpșuni",
                        servingSize: 100,
                        calories: 250,
                        protein: 14,
                        carbs: 12,
                        fibers: 0,
                        fat: 28),
                DishLog(mealtype: 1,
                        title: "Alune",
                        servingSize: 100,
                        calories: 250,
                        protein: 24,
                        carbs: 23,
                        fibers: 0,
                        fat: 25)
            ],
            activities: [
                ActivityLog(title: "Plimbare", calories: 140),
                ActivityLog(title: "Alergare", calories: 140),
                ActivityLog(title: "Somn", calories: 140)
            ],
            weight: 78,
            water: 3),
        Log(id: Date.from(year: 2023, month: 5, day: 9),
            foods: [
                DishLog(mealtype: 1,
                        title: "Halva",
                        servingSize: 100,
                        calories: 250,
                        protein: 74,
                        carbs: 23,
                        fibers: 0,
                        fat: 21),
                DishLog(mealtype: 1,
                        title: "Ciocolată",
                        servingSize: 100,
                        calories: 250,
                        protein: 36,
                        carbs: 63,
                        fibers: 0,
                        fat: 18),
                DishLog(mealtype: 1,
                        title: "Bere",
                        servingSize: 100,
                        calories: 50,
                        protein: 4,
                        carbs: 13,
                        fibers: 0,
                        fat: 45)
            ],
            activities: [
                ActivityLog(title: "Somn", calories: 140),
                ActivityLog(title: "ALergare", calories: 140),
                ActivityLog(title: "Haltere", calories: 140)
            ],
            weight: 20,
            water: 1),
    ]
    var filteredLogs: [Log] {
        logs.filter {
            Calendar.current.compare($0.id, to: selectedDate, toGranularity: .day) == .orderedSame
        }
    }
    var defaultLog: Log {
        Log(id: selectedDate)
    }
    
    // filteredLogs.isEmpty ? defaultLog.water : filteredLogs[0].water
    
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
    }
}
