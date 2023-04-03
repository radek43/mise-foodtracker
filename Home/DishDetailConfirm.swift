//
//  DishDetailConfirm.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 1/10/23.
//

import SwiftUI

struct DishDetailConfirm: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                // HEADER
                VStack {
                    HStack {
                        Text("Fasole Frecata")
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
                
                // FOOD META
                HStack {
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                }
                .card()
                
                // FOOD CHART
                DishDetailChart()
                
                // ADD TO JOURNAL
                Button {
                    // viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Adauga la jurnal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.accent)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: Color.black.opacity(0.1), radius: 12)
                
                Spacer()
            } //: END MAIN VSTACK
            .navigationBarTitle("Detalii Servire", displayMode: .inline)
        } //: END ZSTACK
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
