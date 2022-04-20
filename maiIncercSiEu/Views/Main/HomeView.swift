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
                    ScrollView {
                        DatePickerView()
                        
                        CaloriiRamaseView()
                            
                        MeniuAdaugareView()
                    }
                    Spacer()
                }
            }
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
