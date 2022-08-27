//
//  CardMicut.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct CardMicut: View {
    var body: some View {
        HStack{
            Button(action: {
                print("Buton apasat")
            }) {
                Text("Greutate medie")
            }
            Spacer()
            Text("76.90kg")
        }
        .frame(maxWidth: .infinity)
        .modifier(MakeCard())
    }
}

struct CardMicut_Previews: PreviewProvider {
    static var previews: some View {
        CardMicut()
    }
}
