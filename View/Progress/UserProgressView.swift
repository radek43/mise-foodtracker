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
    @EnvironmentObject var logViewModel: LogViewModel
    
    var demoData: [Double] = [8, 4, 2, 5, 7, 6, 5, 8]
    
    let style = ChartStyle(backgroundColor: Color.card, foregroundColor: [ColorGradient(Color.accent, Color.accent)])
    
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
                            if logViewModel.containsFood() {
                                CardView(showShadow: false) {
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading) {
                                            Text("Calorii din ultima săptămână")
                                                .font(.title3)
                                                .fontWeight(.semibold)

                                            ChartLabel("\(String(format: "%.1f", logViewModel.lastWeekCalories().last!)) kCal", type: .subTitle, format: "%.1f kCal")
                                                .padding([.top, .leading], -8)
                                        }
                                        .padding(.horizontal)

                                        LineChart()
                                            .frame(height: 200)
                                    }
                                    .background(Color.card)
                                    .padding(.bottom, 8)
                                }
                                .data(logViewModel.lastWeekCalories())
                                .chartStyle(style)
                                .padding(.top)
                                .background(Color.card)
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .frame(maxWidth: 580)
                                .padding(.horizontal)
                                .frame(height: idiom == .pad ? 350 : 300)
                            
                            
                                VStack(alignment: .leading) {
                                    Text("Top alimente calorice consumate")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.bottom)
                                    ForEach(logViewModel.lastWeekFoods(), id: \.0) { item in
                                        Group {
                                            Text("\(item.0)")
                                            Text("\(item.1, specifier: "%.f") kCal")
                                                .font(.body)
                                                .fontWeight(.semibold)
                                            Divider()
                                        }
                                    }
                                }
                                .card()
                            }
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
        let logViewModel = LogViewModel()
        
        logViewModel.logs = logPreviewData
        viewModel.currentUser = userPreviewData
        
        return Group {
            UserProgressView()
            UserProgressView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
        .environmentObject(logViewModel)
    }
}
