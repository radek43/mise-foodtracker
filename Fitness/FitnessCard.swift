//
//  FitnessCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/3/22.
//

import SwiftUI

struct FitnessCard: View {
    // MARK: - PROPERTIES
    var exercitiu : Excercise
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
            VStack(alignment: .leading, spacing: 2.0) {
                Text(exercitiu.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                HStack(spacing: 2) {
                    Image(systemName: "speedometer")
                    Text("Dificultate: \(exercitiu.dificulty)")
                        .padding(.trailing)
                }
                .font(.footnote)
                .foregroundColor(Color.secondary)
                
                HStack(spacing: 2) {
                    Image(systemName: "clock")
                    Text("Timp executie: \(exercitiu.duration) min.")
                }
                .font(.footnote)
                .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            Image("exercitiu")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
        }
        .modifier(MakeCard())
    }
}

// MARK: - PREVIEW
struct FitnessCard_Previews: PreviewProvider {
    static var previews: some View {
        FitnessCard(exercitiu: Excercise.dummyData[0])
    }
}
