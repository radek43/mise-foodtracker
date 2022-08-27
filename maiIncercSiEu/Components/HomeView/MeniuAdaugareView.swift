//
//  MeniuAdaugareView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/17/22.
//

import SwiftUI

// MARK: - PROPERTIES


// MARK: - BODY

struct MeniuAdaugareView: View {
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                ButonMeniuAdaugare(imageName: "breakfastIcon", title: "mic\ndejun")
                ButonMeniuAdaugare(imageName: "lunchIcon", title: "pranz")
                ButonMeniuAdaugare(imageName: "dinnerIcon", title: "cina")
                ButonMeniuAdaugare(imageName: "snacksIcon", title: "gustari")

            }.frame(maxWidth: .infinity)
            HStack(alignment: .top) {
                ButonMeniuAdaugare(imageName: "sportsIcon", title: "sport")
                ButonMeniuAdaugare(imageName: "weightIcon", title: "greutate")
                ButonMeniuAdaugare(imageName: "waterIcon", title: "lichide")
            }.frame(maxWidth: .infinity)
        }
        .modifier(MakeCard())
    }
    
}

// MARK: - PREVIEW

struct MeniuAdaugareView_Previews: PreviewProvider {
    static var previews: some View {
        MeniuAdaugareView()
    }
}
