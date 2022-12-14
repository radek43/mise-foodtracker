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
            ScrollView {
                VStack {
                    ForEach(excersises) { excersise in
                        NavigationLink(destination: FitnessDetailView()) {
                            FitnessCard(exercitiu: excersise)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Fitness")
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
    }
}

// MARK: - PREVIEW
struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessView(excersises: Excercise.dummyData)
    }
}
