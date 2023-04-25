//
//  DailyCaloriesChart.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/29/22.
//

import SwiftUI
import SwiftUICharts

struct DailyCaloriesChart: View {
    // MARK: - PROPERTIES
    var demoData: [Double] = [19, 13, 12]
    let mixedColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [
        ColorGradient(Color.green, Color.green), ColorGradient(Color.orange, Color.orange), ColorGradient(Color.blue, Color.blue)])
    
    // MARK: - BODY
    var body: some View {
        CardView(showShadow: false) {
            VStack {
                // CHART HEADER
                ChartLabel("Sumar", type: .subTitle)
                    .padding([.top, .leading, .trailing], 8)
                // CHART
                HStack(alignment: .center) {
                    PieChart()
                        .padding([.leading, .bottom])
                    // CHART LEGEND
                    VStack {
                        HStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.orange, Color.orange]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(width: 15, height: 15)
                            ChartLabel("\(demoData[1])g \nProteine", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                        }
                        HStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue, Color.blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(width: 15, height: 15)
                            ChartLabel("\(demoData[2])g \nCarbohidrati", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                        }
                        HStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.green, Color.green]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .frame(width: 15, height: 15)
                            ChartLabel("\(demoData[0])g \nGrasimi", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                        }
                    }
                }
            } //: END VSTACK
            .background(Color.card)
        } //: END CARDVIEW
        .data(demoData)
        .chartStyle(mixedColorStyle)
        .allowsHitTesting(false)
        .frame(height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
        .padding(.horizontal)
        .frame(maxWidth: 580)
    }
}


// MARK: - PREVIEWS
struct DailyCaloriesChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                DailyCaloriesChart()
            }
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                DailyCaloriesChart()
            }
                .preferredColorScheme(.dark)
        }
    }
}
