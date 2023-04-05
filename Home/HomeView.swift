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
    @EnvironmentObject var viewModel: AuthViewModel
    @State var uiTabarController: UITabBarController?
    @State private var data = Date()
    @State var showDishSheet = false

    
    // MARK: - BODY
    var body: some View {
        if let user = viewModel.currentUser {
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
                        VStack(alignment: .leading) {
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
                        }
                        .card()
                        
                        // LOG EATEN FOOD
                        VStack(alignment: .leading) {
                            Text("Jurnal")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            HStack(alignment: .top, spacing: 0.0) {
                                Spacer()
                                Button {
                                    self.showDishSheet.toggle()
                                } label: {
                                    AddDishButton(imageName: "breakfast", title: "mic\ndejun")
                                }
                                .sheet(isPresented: $showDishSheet) {
                                    DishDetailConfirm()
                                }
                                Spacer()
                                Button {
                                    print("Buton pranz apasat")
                                } label: {
                                    AddDishButton(imageName: "soupLadle", title: "prânz")
                                }
                                Spacer()
                                // RingView()
                                Button {
                                    print("Buton cina apasat")
                                } label: {
                                    AddDishButton(imageName: "pastaDish", title: "cină")
                                }
                                Spacer()
                                Button {
                                    print("Am apasat")
                                } label: {
                                    AddDishButton(imageName: "icecream", title: "gustări")
                                }
                                Spacer()
                            }
                            
                            HStack(alignment: .top, spacing: 0.0) {
                                Spacer()
                                Spacer()
                                Button {
                                    print("Buton sport apasat")
                                } label: {
                                    AddDishButton(imageName: "sprint", title: "sport")
                                }
                                Spacer()
                                Button {
                                    print("Buton greutate apasat")
                                } label: {
                                    AddDishButton(imageName: "weightScale", title: "greutate")
                                }
                                Spacer()
                                Button {
                                    print("Buton lichide apasat")
                                } label: {
                                    AddDishButton(imageName: "waterDrop", title: "lichide")
                                }
                                Spacer()
                                Spacer()
                            }
                        }
                        .card()
                        
                        DailyCaloriesChart()
                            .padding(.bottom, 20)
                        
                    } //: END SCROLL VIEW
                    .navigationTitle("Pagina Principală")
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
