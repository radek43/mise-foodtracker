//
//  ChartTest.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 23.03.2023.
//

import SwiftUI
import SwiftUICharts

struct ChartTest: View {
    var demoData: [Double] = [8, 4, 2]
    let mixedColorStyle = ChartStyle(backgroundColor: Color("CardBackground"), foregroundColor: [
        ColorGradient(.purple, .blue), ColorGradient(.pink, .yellow), ColorGradient(.red, .green)])
    @ScaledMetric var size: CGFloat = 1
    
    var body: some View {
        VStack {
            CardView {
                PieChart()
                    .data(demoData)
                    .chartStyle(mixedColorStyle)
            }
            .frame(height: 250)
            
        }
    }
}

struct ChartTest_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChartTest()
            ChartTest()
                .preferredColorScheme(.dark)
        }
    }
}
