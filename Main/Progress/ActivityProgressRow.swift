//
//  ActivityProgressRow.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct ActivityProgressRow: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
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

// MARK: - PREVIEWS
struct CardMicut_Previews: PreviewProvider {
    static var previews: some View {
        ActivityProgressRow()
    }
}
