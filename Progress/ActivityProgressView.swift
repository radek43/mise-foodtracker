//
//  ActivityProgressView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI
import SwiftUICharts

struct ActivityProgressView: View {
    // MARK: - PROPERTIES
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5, 8]
    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [ColorGradient(.purple, .blue)])
    
    @ScaledMetric var size: CGFloat = 1
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Calorii saptamanale")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    LineChart()
                        .data(demoData)
                        .chartStyle(mixedColorStyle)
                }
                .frame(minHeight: 256)
                .frame(maxWidth: 612)
                .modifier(MakeCard())
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Text("Top calorii alimente consumate")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    BarChart()
                        .data(demoData)
                        .chartStyle(mixedColorStyle)
                }
                .frame(minHeight: 256)
                .frame(maxWidth: 612)
                .modifier(MakeCard())
                .padding(.horizontal)
                
                VStack {
                    ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                    ActivityProgressRow(progressTitle: "Medie pasi facuti saptamanal", progressValue: "5749", measurementUnit: "pasi")
                    ActivityProgressRow(progressTitle: "Indice Masa Corporala", progressValue: "22.3", measurementUnit: "IMC")
                }
            }
            .navigationTitle("Progres")
        }
    }
}

// MARK: - PREVIEW
struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActivityProgressView()
        }
    }
}
