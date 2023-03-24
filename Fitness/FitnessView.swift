//
//  FitnessView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct FitnessView: View {
    // MARK: - PROPERTIES
    var excersises: [Excercise] = Excercise.dummyData
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack(alignment: .center) {
                        SearchBar(placeholderText: "Cauta un exercitiu",text: .constant("")) // de adaugat bindingul corespunzator pentru functia de cautare
                            .padding(.bottom, 3)
                            
                        Button {
                            print("buton setari retete apasat")
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5.0)
                    .frame(maxWidth: 612)

                    ForEach(excersises) { excersise in
                        NavigationLink(destination: FitnessDetailView()) {
                            FitnessCard(exercitiu: excersise)
                                .frame(maxWidth: 612)
                                .foregroundColor(.primary)
                                
                        }
                    }
                }
            }
            .navigationTitle("Fitness")
        }
    }
}

// MARK: - PREVIEW
struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                FitnessView()
            }
            NavigationView {
                FitnessView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
