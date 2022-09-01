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
    
    // MARK: - BODY
    
    var body: some View {
        
        if let user = authViewModel.currentUser{
            NavigationView {
                ZStack {
                    VStack {
                        ScrollView(showsIndicators: false)  {
                            TitleWithButton(numeTitlu: "Buna Seara, \(user.username)")
                            
                            Spacer()
                            
                            DatePickerView()
            
                            CaloriiRamaseView()
                                
                            MeniuAdaugareView()
                            
                            JurnalCaloriiView()
                                
                        }
                        
                    }
                }
                //.fixedSize(horizontal: true, vertical: false)
                //.frame(maxHeight: 200)
                .navigationTitle("Food Tracker")
                .navigationBarHidden(true)
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            }
            
            .modifier(BlurSafeArea())
            .navigationViewStyle(.stack)
        } //: end if let
        
    }//: end body
}

// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
