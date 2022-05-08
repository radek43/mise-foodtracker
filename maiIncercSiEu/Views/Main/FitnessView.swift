//
//  FitnessView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct FitnessView: View {
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    Title(numeTitlu: "Fitness")
                        
                }
                .navigationTitle("Fitness")
                .navigationBarHidden(true)
            }
        
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessView()
    }
}
