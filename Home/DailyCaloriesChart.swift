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
    let mixedColorStyle = ChartStyle(backgroundColor: Color("CardBackground"), foregroundColor: [
        ColorGradient(.purple, .blue), ColorGradient(.pink, .yellow), ColorGradient(.red, .green)])
    @ScaledMetric var size: CGFloat = 1
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Sumar")
                    .font(.title3)
                    .fontWeight(.semibold)
                    //.font(.system(size: 20 + size, weight: .semibold))
                Spacer()
                Text("1189 kCal")
                    .font(.body)
                    .fontWeight(.semibold)
            }
        
            HStack(alignment: .center) {
                PieChart()
                    .data(demoData)
                    .chartStyle(mixedColorStyle)
                Spacer()
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Circle()
                            .fill(LinearGradient(
                                    gradient: Gradient(colors: [.purple, .blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            .frame(width: 20, height: 20)
                        Text("\(demoData[0], specifier: "%.1f")g \nGrasimi")
                            //.font(.system(size: 17 + size, weight: .medium))
                            //.minimumScaleFactor(0.01)
                        Spacer()
                    }
                    
                    HStack(alignment: .center) {
                        Circle()
                            .fill(LinearGradient(
                                    gradient: Gradient(colors: [.pink, .yellow]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            .frame(width: 20, height: 20)
                        Text("\(demoData[1], specifier: "%.1f")g \nProteine")
                            //.font(.system(size: 17 + size, weight: .medium))
                            //.minimumScaleFactor(0.01)
                        Spacer()
                    }
                    
                    HStack(alignment: .center) {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.red, .green]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            .frame(width: 20, height: 20)
                        Text("\(demoData[2], specifier: "%.1f")g \nCarbohidrati")
                            //.font(.system(size: 17 + size, weight: .medium))
                            //.minimumScaleFactor(0.01)
                        Spacer()
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
        .frame(minHeight: 200)
    }
}

// MARK: - PREVIEW
struct DailyCaloriesChart_Previews: PreviewProvider {
    static var previews: some View {
        DailyCaloriesChart()
        
    }
}
