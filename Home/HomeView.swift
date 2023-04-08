//
//  HomeView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI
import Kingfisher
import SwiftUICharts


struct HomeView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var uiTabarController: UITabBarController?
    @State private var data = Date()
    @State private var showDishSheet = false
    @State private var height = 0
    
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            NavigationView {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        // DATE PICKER
                        VStack {
                            DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
                                .accentColor(.primary)
                        }
                        .card()
                        .padding(.top)
                        
                        // USER OBJECTIVE
                        VStack(alignment: .center) {
                            HStack {
                                Text("Obiectiv")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("2342 kCal")
                                    .font(.body)
                                    .fontWeight(.semibold)
                            }
                            HStack {
                                Spacer()
                                Text("2342 kCal Ramase")
                                    .fontWeight(.semibold)
                                    .padding(5)
                                Spacer()
                            }
                            ProgressView(value: 0.25)
                            
                            HStack {
                                VStack {
                                    Text("0")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    Text("Consumat")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack {
                                    Text("0")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    Text("Ars")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack {
                                    Text("0")
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    Text("Net")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .fixedSize(horizontal: false, vertical: true)
                        }
                        .card()
                        
                        // LOG EATEN FOOD
                        VStack(alignment: .center) {
                            HStack {
                                Text("Jurnal")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            HStack(alignment: .top) {
                                
                                Button {
                                    self.showDishSheet.toggle()
                                } label: {
                                    AddDishButton(imageName: "breakfast", title: "mic\ndejun")
                                }
                                .sheet(isPresented: $showDishSheet) {
                                    DishDetailConfirm()
                                }
                                Button {
                                    print("Buton pranz apasat")
                                } label: {
                                    AddDishButton(imageName: "soupLadle", title: "prânz")
                                }
                                // RingView()
                                Button {
                                    print("Buton cina apasat")
                                } label: {
                                    AddDishButton(imageName: "pastaDish", title: "cină")
                                }
                                Button {
                                    print("Am apasat")
                                } label: {
                                    AddDishButton(imageName: "icecream", title: "gustări")
                                }
                            }
                            
                            HStack(alignment: .top) {
                                Button {
                                    print("Buton sport apasat")
                                } label: {
                                    AddDishButton(imageName: "sprint", title: "sport")
                                }
                                Button {
                                    print("Buton greutate apasat")
                                } label: {
                                    AddDishButton(imageName: "weightScale", title: "greutate")
                                }
                                Button {
                                    print("Buton lichide apasat")
                                } label: {
                                    AddDishButton(imageName: "waterDrop", title: "lichide")
                                }
                            }
                        }
                        .card()
                        
                        DailyCaloriesChart()
                            .padding(.bottom, 20)
                        
                    } //: END SCROLL VIEW
                    .navigationTitle("Bine ai venit!")
                    .navigationBarItems(
                        trailing:
                            NavigationLink {
                                SettingsView()
                            } label: {
                                Image(systemName: "gearshape")
                            }
                    )
                } //: END ZSTACK
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
