//
//  Test.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.05.2023.
//

import SwiftUI

struct Test: View {
    
    @State private var selectedDate: Date = Date()
    
    var logs: [Log] = [
        Log(id: Date.from(year: 2023, month: 5, day: 7),
            foods: [
                DishLog(mealtype: 1,
                        title: "Cartofi prajiti",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Ciorbă de cartofi",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Cereale cu lapte",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25)
            ],
            activities: [
                ActivityLog(title: "Alergare", calories: 140),
                ActivityLog(title: "Haltere", calories: 140),
                ActivityLog(title: "Plimbare", calories: 140)
            ],
            weight: 50,
            water: 6),
        
        Log(id: Date.from(year: 2023, month: 5, day: 8),
            foods: [
                DishLog(mealtype: 1,
                        title: "Pepene roșu",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Căpșuni",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Alune",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
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
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Ciocolată",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25),
                DishLog(mealtype: 1,
                        title: "Bere",
                        servingSize: 100,
                        calories: 250,
                        protein: 4,
                        carbs: 43,
                        fibers: 0,
                        fat: 25)
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
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                DatePicker("Data:", selection: $selectedDate, displayedComponents: .date)
                    .card()
                HStack {
                    Text("Apă: \(filteredLogs.isEmpty ? defaultLog.water : filteredLogs[0].water, specifier: "%.f") pahare")
                    Spacer()
                }
                .card()
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Test()
            Test()
                .preferredColorScheme(.dark)
        }
    }
}
