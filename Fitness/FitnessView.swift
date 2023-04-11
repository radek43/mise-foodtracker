//
//  FitnessView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct FitnessView: View {
    // MARK: - PROPERTIES
    var excersises: [Excersise]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
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
                        .padding([.top, .leading, .trailing])
                        .padding(.bottom, 5.0)
                        .frame(maxWidth: 580)
                        
                        ForEach(excersises) { excersise in
                            NavigationLink(destination: FitnessDetailView()) {
                                FitnessCard(exercitiu: excersise)
                                    .frame(maxWidth: 612)
                                    .foregroundColor(.primary)
                            }
                        }
                    } //: END MAIN VSTACK
                } //: END SCROLL VIEW
                .navigationTitle("Fitness")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK: - PREVIEW
struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FitnessView(excersises: excercisePreviewData)
            FitnessView(excersises: excercisePreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
