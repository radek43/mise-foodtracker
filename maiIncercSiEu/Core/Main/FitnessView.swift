//
//  FitnessView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct FitnessView: View {
    
    // MARK: - PROPERTIES
    
    var excersises: [Excercise]
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView{
                        Title(numeTitlu: "Fitness")
                        VStack {
                            ForEach(excersises) { excersise in
                                NavigationLink(destination: FitnessViewDetail()) {
                                    FitnessCard(exercitiu: excersise)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Fitness")
            .navigationBarHidden(true)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessView(excersises: Excercise.dummyData)
    }
}
