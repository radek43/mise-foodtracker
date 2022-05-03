//
//  JurnalCaloriiView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/29/22.
//

import SwiftUI
import SwiftUICharts


struct JurnalCaloriiView: View {
    let chartStyle = ChartStyle(backgroundColor: Color.white,
                                accentColor: Colors.LegendDarkColor,
                                secondGradientColor: Colors.LegendDarkColor,
                                textColor: Color.black,
                                legendTextColor: Color.gray,
                                dropShadowColor: Color.gray)
    
    var body: some View {
        HStack{
            PieChartView(data: [56,22,22], title: "Graf nutrienti:", style: chartStyle)//, form: ChartForm.large)
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 180.0, height: 240.0)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.4), radius: 12)
                VStack(alignment: .leading){
                    Text("Detalii:")
                        .font(.headline)
                        .padding()
                    Spacer()
                    Text("26g - Proteine")
                        .font(.title3)
                        .padding(5)
                    Text("26g - Carbohidrati")
                        .font(.title3)
                        .padding(5)
                    Text("26g - Grasimi")
                        .font(.title3)
                        .padding(5)
                    Spacer()
                }
                
            }.frame(width: 180.0, height: 240.0)
        }.fixedSize(horizontal: true, vertical: true)
        
        
        

    }
}

struct JurnalCaloriiView_Previews: PreviewProvider {
    static var previews: some View {
        JurnalCaloriiView()
        
    }
}
