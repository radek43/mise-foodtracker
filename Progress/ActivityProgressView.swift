//
//  ActivityProgressView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI
import SwiftUICharts


struct ActivityProgressView: View {
    // MARK: - PROPERTIES
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5, 8]
    let mixedColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [ColorGradient(Color.accent, Color.accent)])
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    // WEEKLY CALORIES
                    CardView(showShadow: false) {
                        VStack(alignment: .leading) {
                            Text("Calorii saptamanale")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding()
                            LineChart()
                                .data(demoData)
                                .chartStyle(mixedColorStyle)
                        }
                        .background(Color.card)
                    }
                    .frame(height: 250)
                    .frame(maxWidth: 612)
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding([.horizontal, .top])
                    
                    // MOST EATEN FOODS
                    CardView(showShadow: false) {
                        VStack(alignment: .leading) {
                            Text("Top alimente calorice consumate")
                                .font(.title3)
                                .fontWeight(.semibold)
                            BarChart()
                                .data(demoData)
                                .chartStyle(mixedColorStyle)
                        }
                        .padding([.top, .leading, .trailing])
                        .background(Color.card)
                        
                    }
                    .frame(height: 250)
                    .frame(maxWidth: 612)
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding(.horizontal)
                    
                    // USER STATS
                    VStack {
                        ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                        ActivityProgressRow(progressTitle: "Medie pasi facuti saptamanal", progressValue: "5749", measurementUnit: "pasi")
                        ActivityProgressRow(progressTitle: "Indice Masa Corporala", progressValue: "22.3", measurementUnit: "IMC")
                    }
                } //: END SCROLL VIEW
                .navigationTitle("Progres")
            }
        } //: END ZSTACK
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK: - PREVIEW
struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivityProgressView()
            ActivityProgressView()
                .preferredColorScheme(.dark)
        }
    }
}
