//
//  ActivityProgressView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI
import SwiftUICharts

struct ActivityProgressView: View {
    
    //let stil =  ChartStyle(backgroundColor: Color.white, accentColor: Color.blue, secondGradientColor: Color.blue, textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray)
    
    var body: some View {
        NavigationView{
            ScrollView{
                Title(numeTitlu: "Progres")
                
                VStack{
                    //LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Calorii Consumate  Saptmanal", form: ChartForm.extraLarge)
                    
                    //BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Top calorii alimente consumate", style: Styles.barChartStyleNeonBlueLight,form: ChartForm.extraLarge)
                        //.padding(.horizontal)
                    CardMicut()
                }
                    
                
                
                
            }
            .navigationTitle("Progres")
            .navigationBarHidden(true)
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityProgressView()
    }
}
