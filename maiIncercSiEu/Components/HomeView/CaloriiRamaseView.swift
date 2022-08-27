//
//  CaloriiRamaseView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/17/22.
//

import SwiftUI

struct CaloriiRamaseView: View {
    var body: some View {
            VStack{
                Text("2342 Calorii Ramase")
                    .padding(5)
                ProgressView(value: 0.25)
                HStack{
                    VStack{
                        Text("0")
                        Text("Consumat")
                    }.frame(maxWidth: .infinity)
                    VStack{
                        Text("0")
                        Text("Ars")
                    }.frame(maxWidth: .infinity)
                    VStack{
                        Text("0")
                        Text("Net")
                    }.frame(maxWidth: .infinity)
                }
                
            }
            .modifier(MakeCard())
    }
    
}

struct CaloriiRamaseView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriiRamaseView()
    }
}
