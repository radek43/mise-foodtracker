//
//  FitnessCard.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 9/3/22.
//

import SwiftUI

struct FitnessCard: View {
    // MARK: - PROPERTIES
    var exercitiu : Excersise
    //    var numeExercitiu: String
    //    var dificultate: String
    //    var timpExecutie: String
    
    //    init(numeExercitiu: String, dificultate: String, timpExecutie: String) {
    //        self.numeExercitiu = numeExercitiu
    //        self.dificultate = dificultate
    //        self.timpExecutie = timpExecutie
    //    }
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text("Abdomene")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            Text("Abdomene")
                .font(.title3)
                .fontWeight(.semibold)

        }
        .card()
    }
}

// MARK: - PREVIEW
struct FitnessCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                FitnessCard(exercitiu: Excersise.dummyData[0])
            }
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                FitnessCard(exercitiu: Excersise.dummyData[0])
            }
            .preferredColorScheme(.dark)
        }
    }
}
