//
//  ActivityProgressView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 21.04.2022.
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
            ScrollView(showsIndicators: false) {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        // Weekly calories
                        CardView(showShadow: false) {
                            VStack(alignment: .leading) {
                                Text("Calorii saptamanale")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .padding()
                                LineChart()
                                    .data(demoData)
                                    .chartStyle(mixedColorStyle)
                                    .padding(.bottom, 5)
                            }
                            .background(Color.card)
                        }
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        .padding([.horizontal, .top])
                        .frame(maxWidth: 580)
                        
                        // Top foods eaten
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
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                        .padding(.horizontal)
                        .frame(maxWidth: 580)
                        
                        // User details
                        VStack {
                            ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                            ActivityProgressRow(progressTitle: "Medie pasi facuti saptamanal", progressValue: "5749", measurementUnit: "pasi")
                            ActivityProgressRow(progressTitle: "Indice Masa Corporala", progressValue: "22.3", measurementUnit: "IMC")
                        }
                    }
                    .navigationTitle("Progres")
                }
            }
            .background(Color.background.edgesIgnoringSafeArea(.all))
        }
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
