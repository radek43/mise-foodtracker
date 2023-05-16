//
//  NutritionChart.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.05.2023.
//

import SwiftUI
import SwiftUICharts

struct NutritionChart: View {
    // MARK: - PROPERTIES
    let defaultColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [
        ColorGradient(Color.green, Color.green), ColorGradient(Color.orange, Color.orange), ColorGradient(Color.blue, Color.blue)])
    let disabledColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: ColorGradient(Color.progress, Color.progress))
    
    let chartTitle: String
    
    let protein: Double
    let carbs: Double
    let fat: Double
    
    var isDisabled = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(chartTitle)
                .font(.title2)
                .fontWeight(.semibold)
            HStack(alignment: .center) {
                PieChart()
                    .data([protein, fat, carbs])
                    .chartStyle(isDisabled ? disabledColorStyle : defaultColorStyle)
                    .allowsHitTesting(false) // crash if true
                    .frame(minHeight: 200)
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Circle()
                            .fill(isDisabled ? Color.progress : Color.green)
                            .frame(width: 15, height: 15)
                        VStack(alignment: .leading) {
                            Text("\(isDisabled ? 0 : protein, specifier: "%.1f")g")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Proteine")
                                .font(.body)
                        }
                    }
                    HStack(alignment: .center) {
                        Circle()
                            .fill(isDisabled ? Color.progress : Color.orange)
                            .frame(width: 15, height: 15)
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("\(isDisabled ? 0 : fat, specifier: "%.1f")g")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Grăsimi")
                                .font(.body)
                        }
                        .font(.body)
                    }
                    HStack(alignment: .center) {
                        Circle()
                            .fill(isDisabled ? Color.progress : Color.blue)
                            .frame(width: 15, height: 15)
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("\(isDisabled ? 0 : carbs, specifier: "%.1f")g")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Carbohidrați")
                                .font(.body)
                                
                        }.font(.body)
                    }
                }
                .frame(minWidth: 140)
                
                Spacer()
            }
        }
        .card()
    }
}

// MARK: - PREVIEW
struct NutritionChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                NutritionChart(chartTitle: "Valori nutriționale", protein: 1, carbs: 1, fat: 1)
                    
            }
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                NutritionChart(chartTitle: "Valori nutriționale", protein: 12, carbs: 13, fat: 14)
                    .preferredColorScheme(.dark)
            }
        }
    }
}
