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
    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
        ColorGradient(.purple, .blue), ColorGradient(.pink, .yellow), ColorGradient(.red, .green)])
    @ScaledMetric var size: CGFloat = 1
    
    // MARK: - BODY
    
    var body: some View {
        VStack{
            HStack{
                Text("Sumar")
                    .font(.system(size: 20 + size, weight: .semibold, design: .rounded))
                Spacer()
                Text("1189 kCal")
                    .font(.system(size: 15 + size, weight: .semibold, design: .rounded))
            }
        
            HStack{
                PieChart()
                    .data(demoData)
                    .chartStyle(mixedColorStyle)

                Spacer()
                
                VStack{
                    HStack{
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .leading, endPoint: .trailing)
                                )
                            .frame(width: 20, height: 20)
                        
                        Text("\(demoData[0], specifier: "%.1f")g \nGrasimi")
                            .font(.system(size: 17 + size, weight: .medium, design: .rounded))
                            .minimumScaleFactor(0.01)
                        Spacer()
                    }
                    
                    HStack{
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.pink, .yellow]), startPoint: .leading, endPoint: .trailing)
                                )
                            .frame(width: 20, height: 20)
                        
                        Text("\(demoData[1], specifier: "%.1f")g \nProteine")
                            .font(.system(size: 17 + size, weight: .medium, design: .rounded))
                            .minimumScaleFactor(0.01)
                        Spacer()
                    }
                    
                    HStack{
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .leading, endPoint: .trailing)
                                )
                            .frame(width: 20, height: 20)
                        
                        Text("\(demoData[2], specifier: "%.1f")g Carbohidrati")
                            .font(.system(size: 17 + size, weight: .medium, design: .rounded))
                            .minimumScaleFactor(0.01)
                        Spacer()
                    }
                }
            }
        }
        .modifier(MakeCard())
        //.frame(width: UIScreen.main.bounds.width * 0.9, height:  UIScreen.main.bounds.height * 0.33)
    }
}

// MARK: - PREVIEW

struct JurnalCaloriiView_Previews: PreviewProvider {
    static var previews: some View {
        DailyCaloriesChart()
        
    }
}
