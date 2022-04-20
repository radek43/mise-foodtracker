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
                        Text("Consumate")
                    }.frame(maxWidth: .infinity)
                    VStack{
                        Text("0")
                        Text("Arse")
                    }.frame(maxWidth: .infinity)
                    VStack{
                        Text("0")
                        Text("Net")
                    }.frame(maxWidth: .infinity)
                }
                
            }
            .padding()
            .background(Color(UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding([.top, .leading, .trailing])
            .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
            
        

    }
    
}

struct CaloriiRamaseView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriiRamaseView()
    }
}
