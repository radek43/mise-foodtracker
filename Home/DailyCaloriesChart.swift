//
//  DailyCaloriesChart.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/29/22.
//

import SwiftUI
import SwiftUICharts

struct DailyCaloriesChart: View {
    // MARK: - PROPERTIES
    var demoData: [Double] = [8, 4, 2]
    let mixedColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [
        ColorGradient(Color.accent, .blue), ColorGradient(.pink, .yellow), ColorGradient(.red, .green)])
    @ScaledMetric var size: CGFloat = 1
    
    // MARK: - BODY
    var body: some View {
        CardView(showShadow: false) {
            VStack {
                ChartLabel("Sumar", type: .subTitle)
                    .padding([.top, .leading, .trailing])
                HStack(alignment: .center) {
                        PieChart()
                            .padding(.leading)
                        
                        VStack {
                            HStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.pink, .yellow]),
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                    .frame(width: 15, height: 15)
                                ChartLabel("\(demoData[1])g \nProteine", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                                
                            }
                            HStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.red, .green]),
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                    .frame(width: 15, height: 15)
                                ChartLabel("\(demoData[2])g \nCarbohidrati", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                            }
                            HStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.accent, .blue]),
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                    .frame(width: 15, height: 15)
                                ChartLabel("\(demoData[0])g \nGrasimi", type: .custom(size: 17, padding: EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2), color: .primary))
                            }
                        }
                        
                    }
                }
                .background(Color.card)

            }
            .data(demoData)
            .chartStyle(mixedColorStyle)
            .frame(height: 250)
    }
}

// MARK: - PREVIEW
struct DailyCaloriesChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DailyCaloriesChart()
            DailyCaloriesChart()
                .preferredColorScheme(.dark)
        }
    }
}
