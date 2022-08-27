//
//  ActivityProgressView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI
import SwiftUICharts

struct ActivityProgressView: View {
    
    
    
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5]
    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
        ColorGradient(.purple, .blue)])
    
    @ScaledMetric var size: CGFloat = 1
    
    var body: some View {
        NavigationView{
            ScrollView{
                Title(numeTitlu: "Progres")

                VStack{
                    
                    VStack{
                        HStack{
                            Text("Calorii saptamanale").font(.system(size: 20 + size, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                        
                        LineChart()
                            .data(demoData)
                            .chartStyle(mixedColorStyle)
       
                        
                    }
                    .modifier(MakeCard())
                        .frame(width: UIScreen.main.bounds.width * 0.9, height:  UIScreen.main.bounds.height * 0.33)
                    VStack{
                        HStack{
                            Text("Top calorii alimente consumate").font(.system(size: 20 + size, weight: .semibold, design: .rounded))
                            Spacer()
                        }
                        
                        BarChart()
                            .data(demoData)
                            .chartStyle(mixedColorStyle)
       
                        
                    }
                    .modifier(MakeCard())
                        .frame(width: UIScreen.main.bounds.width * 0.9, height:  UIScreen.main.bounds.height * 0.33)
                    
                    JurnalCaloriiView()
                    
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
