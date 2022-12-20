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
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var uiTabarController: UITabBarController?
    @State private var data = Date()

    // MARK: - BODY
    var body: some View {
        // if let user = authViewModel.currentUser {
            ScrollView(showsIndicators: false) {
                // Vizualizare Data
                VStack {
                    DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
                        .accentColor(.primary)
                }
                .modifier(MakeCard())
                .padding(.horizontal)
                
                // Vizualizare Calorii Ramase
                VStack {
                    Text("2342 Calorii Ramase")
                        .fontWeight(.semibold)
                        .padding(5)
                    
                    ProgressView(value: 0.25)
                    
                    HStack {
                        VStack {
                            Text("0")
                                .fontWeight(.medium)
                            Text("Consumat")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("0")
                                .fontWeight(.medium)
                            Text("Ars")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("0")
                                .fontWeight(.medium)
                            Text("Net")
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .modifier(MakeCard())
                .padding(.horizontal)

                // Meniu adaugare alimente consumate
                VStack(alignment: .leading) {
                    Text("Jurnal")
                        .font(.title3)
                        .fontWeight(.semibold)
                
                    HStack(alignment: .top) {
                        Button { print("Buton micDejun apasat")
                        } label: { AddFoodButton(imageName: "breakfast", title: "mic\ndejun") }
                        Button { print("Buton pranz apasat")
                        } label: { AddFoodButton(imageName: "soupLadle", title: "prânz") }
                        Button { print("Buton cina apasat")
                        } label: { AddFoodButton(imageName: "pastaDish", title: "cină") }
                        Button { print("Am apasat")
                        } label: { AddFoodButton(imageName: "icecream", title: "gustări") }
                    }.frame(maxWidth: .infinity)
                    
                    HStack(alignment: .top) {
                        Button { print("Buton sport apasat")
                        } label: {AddFoodButton(imageName: "sprint", title: "sport")}
                        Button { print("Buton greutate apasat")
                        } label: { AddFoodButton(imageName: "weightScale", title: "greutate") }
                        Button { print("Buton lichide apasat")
                        } label: { AddFoodButton(imageName: "waterDrop", title: "lichide") }
                    }.frame(maxWidth: .infinity)
                }
                .modifier(MakeCard())
                .padding(.horizontal)

                DailyCaloriesChart()
                    .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Food Tracker")
            .toolbar(content: {
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gearshape")
                }
            })
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        //} //: end if let
    }//: end body
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(AuthViewModel())
    }
}
