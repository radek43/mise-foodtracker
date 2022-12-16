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
                    HStack(alignment: .center, spacing: 3.0) {
                        SearchBar(placeholderText: "Cauta un exercitiu",text: .constant("")) // de adaugat bindingul corespunzator pentru functia de cautare
                            .padding(.bottom, 3)
                        Button {
                            print("buton setari retete apasat")
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .imageScale(.large)
                        }
                    }
                    .padding(.bottom, 5.0)
                    
                    ForEach(excersises) { excersise in
                        NavigationLink(destination: FitnessDetailView()) {
                            FitnessCard(exercitiu: excersise)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Fitness")
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessView(excersises: Excercise.dummyData)
    }
}
