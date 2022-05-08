//
//  HomeView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var uiTabarController: UITabBarController?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(showsIndicators: false)  {
                        TitleWithButton(numeTitlu: "Food Tracker", numeIcon: "person.crop.circle")
                        
                        DatePickerView()
        
                        CaloriiRamaseView()
                            
                        MeniuAdaugareView()
                        
                        JurnalCaloriiView()
                            
                    }
                    Spacer()

                }
            }
            //.fixedSize(horizontal: true, vertical: false)
            //.frame(maxHeight: 200)
            .navigationTitle("Food Tracker")
            .navigationBarHidden(true)

        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)

    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
