//
//  HomeView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    // MARK: - PROPERTIES
//    @EnvironmentObject var authViewModel: AuthViewModel
    @State var uiTabarController: UITabBarController?
    @State private var data = Date()
    @State var showDishSheet = false

    // MARK: - BODY
    var body: some View {
    // if let user = authViewModel.currentUser {
        ZStack {
            Color("ColorBackground")
                .edgesIgnoringSafeArea(.all)
    
            ScrollView(showsIndicators: false) {
                    // Vizualizare Data
                    VStack {
                        DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
                            .accentColor(.primary)
                    }
                    .frame(maxWidth: 612)
                    .modifier(MakeCard())
                    .padding(.horizontal)
                    
                    // Vizualizare Calorii Ramase
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
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("0")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                Text("Ars")
                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("0")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                Text("Net")
                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(maxWidth: 612)
                    .modifier(MakeCard())
                    .padding(.horizontal)

                    // Meniu adaugare alimente consumate
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
                            .sheet(isPresented: $showDishSheet ) {
                                DishDetailConfirm()
                            }
                            Button { print("Buton pranz apasat")
                            } label: { AddDishButton(imageName: "soupLadle", title: "prânz") }
                            //RingView()
                            Button { print("Buton cina apasat")
                            } label: { AddDishButton(imageName: "pastaDish", title: "cină") }
                            Button { print("Am apasat")
                            } label: { AddDishButton(imageName: "icecream", title: "gustări") }
                            Spacer()
                        }
                        
                        HStack(alignment: .top, spacing: 0.0) {
                            Spacer()
                            Button { print("Buton sport apasat")
                            } label: {AddDishButton(imageName: "sprint", title: "sport")}
                            Button { print("Buton greutate apasat")
                            } label: { AddDishButton(imageName: "weightScale", title: "greutate") }
                            Button { print("Buton lichide apasat")
                            } label: { AddDishButton(imageName: "waterDrop", title: "lichide") }
                            Spacer()
                        }
                    }
                    .frame(maxWidth: 612)
                    .modifier(MakeCard())
                    .padding(.horizontal)

                    DailyCaloriesChart()
                        .frame(maxWidth: 612)
                        .modifier(MakeCard())
                        .padding(.horizontal)
                    
                    Spacer()
                }
                .navigationTitle("Food Tracker")
                .navigationBarItems(
                    trailing:
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape")
                        }
                )
        }
        //} //: end if let
    }//: end body
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
//            .environmentObject(AuthViewModel())
    }
}
