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
    
    @State var uiTabarController: UITabBarController?
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var data = Date()
    
    // MARK: - BODY
    
    var body: some View {
       // if let user = authViewModel.currentUser {
            NavigationView {
                VStack {
                    ScrollView(showsIndicators: false) {
                        // Vizualizare Data
                        VStack {
                            DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
                                .accentColor(Color.primary)
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
                        VStack {
                            HStack(alignment: .top) {
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "micDejunOutline", title: "mic\ndejun")
                                }
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "pranzOutline", title: "prânz")
                                }
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "cinaOutline", title: "cină")
                                }
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "gustariOutline", title: "gustări")
                                }
                            }.frame(maxWidth: .infinity)
                            
                            HStack(alignment: .top) {
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "sportOutline", title: "sport")
                                }
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "greutateOutline", title: "greutate")
                                }
                                Button {
                                    print("Am apasat")
                                } label: {
                                    ButonMeniuAdaugare(imageName: "lichideOutline", title: "lichide")
                                }
                            }.frame(maxWidth: .infinity)
                        }
                        .font(.title)
                        .modifier(MakeCard())
                        .padding(.horizontal)
  
                        JurnalCaloriiView()
                            .padding(.horizontal)
                        
                        Spacer()
                    }
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
            }
        //} //: end if let
    }//: end body
}

// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(AuthViewModel())
    }
}
