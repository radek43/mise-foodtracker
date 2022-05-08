//
//  CardMicut.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct CardMicut: View {
    var body: some View {
        VStack{
            Button(action: {
                print("Buton apasat")
            }) {
                Text("Average Weight")
            }
            
            Text("76.90kg")
        }
        .modifier(MakeCard())
    }
}

struct CardMicut_Previews: PreviewProvider {
    static var previews: some View {
        CardMicut()
    }
}
