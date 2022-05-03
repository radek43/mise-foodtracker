//
//  HomeView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/11/22.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(showsIndicators: false)  {
                        DatePickerView()
                        
                        CaloriiRamaseView()
                            
                        MeniuAdaugareView()
                        
                        JurnalCaloriiView()
                            
                    }
                    Spacer()
                }
            }
            .fixedSize(horizontal: true, vertical: false)
            //.frame(maxHeight: 200)
            .navigationTitle("Food Tracker")
        }
        .navigationViewStyle(.stack)
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
