//
//  FoodDetailConfirm.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 1/10/23.
//

import SwiftUI

struct FoodDetailConfirm: View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
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
                
                HStack {
                    FoodDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    FoodDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    FoodDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    FoodDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                }
                .frame(maxWidth: .infinity)
                .modifier(MakeCard())
                .padding(.horizontal)
                
                DailyCaloriesChart()
                    .frame(maxWidth: 612, maxHeight: 200)
                    .modifier(MakeCard())
                    .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarTitle("Detalii Servire", displayMode: .inline)
        }
    }
}

struct FoodDetailConfirm_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailConfirm()
    }
}
