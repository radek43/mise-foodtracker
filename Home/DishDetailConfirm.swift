//
//  DishDetailConfirm.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 1/10/23.
//

import SwiftUI

struct DishDetailConfirm: View {
    var body: some View {
        ZStack {
            Color.background
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
                .padding(.top)
                
                HStack {
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                    DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                }
                .frame(maxWidth: .infinity)
                .modifier(MakeCard())
                .padding(.horizontal)
                
                DishDetailChart()
                    .frame(maxWidth: 612, maxHeight: 200)
                    .modifier(MakeCard())
                    .padding(.horizontal)
                
                Button {
//                    viewModel.login(withEmail: email, password: password)
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
            }
            .navigationBarTitle("Detalii Servire", displayMode: .inline)
        }
    }
}

struct DishDetailConfirm_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DishDetailConfirm()
            DishDetailConfirm()
                .preferredColorScheme(.dark)
        }
        
    }
}
