//
//  UserProgressView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 21.04.2022.
//

import SwiftUI
import SwiftUICharts


struct UserProgressView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5, 8]
    
    let mixedColorStyle = ChartStyle(backgroundColor: Color.card, foregroundColor: [ColorGradient(Color.accent, Color.accent)])
    
    private var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
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
                            .card()
                            .frame(height: idiom == .pad ? 350 : 250)
                            .padding(.top)
                            .allowsHitTesting(false)
                            
                            // Top foods eaten
                            VStack(alignment: .leading) {
                                Text("Top alimente calorice consumate")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                BarChart()
                                    .data(demoData)
                                    .chartStyle(mixedColorStyle)
                            }
                            .card()
                            .frame(height: idiom == .pad ? 350 : 250)
                            .allowsHitTesting(false)
                            
                            // User details
                            VStack {
                                ProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                                ProgressRow(progressTitle: "Medie pași făcuți săptămânal", progressValue: "5749", measurementUnit: "pași")
                                ProgressRow(progressTitle: "Indice Masă Corporală (BMI)", progressValue: "\(user.bmi)", measurementUnit: "BMI")
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
struct UserProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            UserProgressView()
            UserProgressView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
