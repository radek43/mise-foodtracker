//
//  DishDetailConfirm.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.01.2023.
//

import SwiftUI

struct DishDetailConfirm: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                // Header
                VStack {
                    HStack {
                        Text("Cartofi piure")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    HStack {
                        Text("Portie Servita: 1 cupa")
                            .font(.subheadline)
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Log meta
                HStack {
                    Spacer()
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    Spacer()
                }
                .card()
                
                DailyCaloriesChart()
                
                // Add to journal
                Button {
                    // viewModel.login(withEmail: email, password: password)
                } label: {
                    CapsuleButton(text: "Adaugă la jurnal")
                }
                
                Spacer()
            }
            .navigationBarTitle("Detalii Servire", displayMode: .inline)
        }
    }
}


// MARK: - PREVIEWS
struct DishDetailConfirm_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DishDetailConfirm()
            }
            NavigationView {
                DishDetailConfirm()
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
