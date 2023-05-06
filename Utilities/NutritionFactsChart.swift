//
//  NutritionFactsChart.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 29.04.2022.
//

import SwiftUI
import SwiftUICharts

struct NutritionFactsChart: View {
    // MARK: - PROPERTIES
    @State private var protein: Double = 12
    @State private var carbs: Double = 13
    @State private var fats: Double = 14
    
    var chartTitle: String = "Sumar"
    
    let mixedColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [
        ColorGradient(Color.green, Color.green), ColorGradient(Color.orange, Color.orange), ColorGradient(Color.blue, Color.blue)])
    
    // MARK: - BODY
    var body: some View {
        CardView(showShadow: false) {
            VStack {
                ChartLabel(chartTitle, type: .subTitle)
                    .padding([.top, .leading, .trailing], 8)
            
                HStack(alignment: .center) {
                    PieChart()
                        .padding([.leading, .bottom])
                    // Chart legend
                    VStack {
                        HStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.green, Color.green]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(width: 15, height: 15)
                            ChartLabel("\(protein)g \nProteine", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                        }
                        HStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.orange, Color.orange]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(width: 15, height: 15)
                            ChartLabel("\(carbs)g \nCarbohidrati", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                        }
                        HStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue, Color.blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(width: 15, height: 15)
                            ChartLabel("\(fats)g \nGrasimi", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                        }
                    }
                }
            }
            .background(Color.card)
        }
        .data([protein, carbs, fats])
        .chartStyle(mixedColorStyle)
        .allowsHitTesting(false)
        .frame(height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
        .padding(.horizontal)
        .frame(maxWidth: 580)
    }
}


// MARK: - PREVIEWS
struct NutritionFactsChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                NutritionFactsChart()
            }
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                NutritionFactsChart()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
