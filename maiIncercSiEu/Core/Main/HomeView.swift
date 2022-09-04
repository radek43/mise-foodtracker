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
        
       // if let user = authViewModel.currentUser {
            NavigationView {
                ZStack {
                    VStack {
                        ScrollView(showsIndicators: false)  {
                            TitleWithButton(numeTitlu: "Food Tracker") //\(user.username)")
                            DatePickerView()
                            CaloriiRamaseView()
                            MeniuAdaugareView()
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
