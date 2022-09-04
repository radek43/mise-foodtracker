//
//  FitnessList.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/4/22.
//

import SwiftUI

struct FitnessList: View {
    
    var excersises: [Excercise]
    
    var body: some View {
        VStack {
            ForEach(excersises) { excersise in
                NavigationLink(destination: FitnessViewDetail()) {
                    FitnessCard(exercitiu: excersise)
                        .padding(.bottom, 5.0)
                }
            }
        }
    }
}

struct FitnessList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            FitnessList(excersises: Excercise.all)
        }
    }
}
