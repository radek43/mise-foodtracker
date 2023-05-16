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
        Log(dateTime: Date.from(year: 2023, month: 5, day: 6),
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
        
        Log(dateTime: Date.from(year: 2023, month: 5, day: 7), foods: [
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
        Log(dateTime: Date.from(year: 2023, month: 5, day: 8), foods: [
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
            Calendar.current.compare($0.dateTime, to: selectedDate, toGranularity: .day) == .orderedSame
        }
    }
    
    var defaultLog: Log {
        Log(dateTime: selectedDate)
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
