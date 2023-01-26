//
//  DishDetailChart.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 1/11/23.
//

import SwiftUI
import SwiftUICharts

struct DishDetailChart: View {
    // MARK: - PROPERTIES
    var demoData: [Double] = [8, 4, 2]
    let mixedColorStyle = ChartStyle(backgroundColor: Color("CardBackground"), foregroundColor: [
        ColorGradient(.purple, .blue), ColorGradient(.pink, .yellow), ColorGradient(.red, .green)])
    @ScaledMetric var size: CGFloat = 1
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
                Text("Calorii totale: 324 kCal")
                    .font(.title3)
                    .fontWeight(.semibold)
            
        
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
                        Text("Grasimi:\n\(demoData[0], specifier: "%.1f")g  / 57%")
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
                        Text("Proteine:\n\(demoData[1], specifier: "%.1f")g / 29%")
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
                        Text("Carbohidrati:\n\(demoData[2], specifier: "%.1f")g / 14%")
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

struct DishDetail_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailChart()
    }
}
