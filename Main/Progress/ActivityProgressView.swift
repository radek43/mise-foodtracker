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
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5]
    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [ColorGradient(.purple, .blue)])
    
    @ScaledMetric var size: CGFloat = 1
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
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
                            .frame(width: 300)
                    }
                    .modifier(MakeCard())
                    .frame(height: 250)
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
                    .frame(height: 250)
                    .modifier(MakeCard())
                    .padding(.horizontal)

                    //JurnalCaloriiView()
                    
                    VStack {
                        ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                        ActivityProgressRow(progressTitle: "Numar de pasi inregistrati", progressValue: "1573", measurementUnit: "Pasi")
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Progres")
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
    }
}

// MARK: - PREVIEW
struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityProgressView()
    }
}
