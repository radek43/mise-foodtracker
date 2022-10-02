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
                ZStack {
                    VStack {
                        ScrollView(showsIndicators: false)  {
                            TitleWithButton(numeTitlu: "Food Tracker") //\(user.username)")
                            
                            // Vizualizare Data
                            VStack {
                                DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
                            }
                            .modifier(MakeCard())
                            
                            // Vizualizare Calorii Ramase
                            VStack{
                                Text("2342 Calorii Ramase")
                                    .padding(5)
                                ProgressView(value: 0.25)
                                HStack{
                                    VStack{
                                        Text("0")
                                        Text("Consumat")
                                    }.frame(maxWidth: .infinity)
                                    VStack{
                                        Text("0")
                                        Text("Ars")
                                    }.frame(maxWidth: .infinity)
                                    VStack{
                                        Text("0")
                                        Text("Net")
                                    }.frame(maxWidth: .infinity)
                                }
                                
                            }
                            .modifier(MakeCard())
                            
                            // Meniu adaugare alimente consumate
                            VStack{
                                HStack(alignment: .top) {
                                    ButonMeniuAdaugare(imageName: "breakfastIcon", title: "mic\ndejun")
                                    ButonMeniuAdaugare(imageName: "lunchIcon", title: "pranz")
                                    ButonMeniuAdaugare(imageName: "dinnerIcon", title: "cina")
                                    ButonMeniuAdaugare(imageName: "snacksIcon", title: "gustari")

                                }.frame(maxWidth: .infinity)
                                HStack(alignment: .top) {
                                    ButonMeniuAdaugare(imageName: "sportsIcon", title: "sport")
                                    ButonMeniuAdaugare(imageName: "weightIcon", title: "greutate")
                                    ButonMeniuAdaugare(imageName: "waterIcon", title: "lichide")
                                }.frame(maxWidth: .infinity)
                            }
                            .modifier(MakeCard())
                            
                            JurnalCaloriiView()
                        }
                    }
                }
                .navigationTitle("Food Tracker")
                .navigationBarHidden(true)
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            }
            
            .modifier(BlurSafeArea())
            .navigationViewStyle(.stack)
        //} //: end if let
        
    }//: end body
}

// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
