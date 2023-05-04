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
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5, 8]
    let mixedColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [ColorGradient(Color.accent, Color.accent)])
    
    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Color.background
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            // Weekly calories
                            CardView(showShadow: false) {
                                VStack(alignment: .leading) {
                                    Text("Calorii săptămânale")
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
                            .allowsHitTesting(false)
                            
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
                            .allowsHitTesting(false)
                            
                            // User details
                            VStack {
                                ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                                ActivityProgressRow(progressTitle: "Medie pași făcuți săptămânal", progressValue: "5749", measurementUnit: "pași")
                                ActivityProgressRow(progressTitle: "Indice Masă Corporală (BMI)", progressValue: "\(user.bmi)", measurementUnit: "BMI")
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
}


// MARK: - PREVIEW
struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            ActivityProgressView()
            ActivityProgressView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
