//
//  MeniuAdaugareView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/17/22.
//

import SwiftUI

struct MeniuAdaugareView: View {
    var body: some View {
        VStack{
            HStack{
                ButonMeniuAdaugareView(imageName: "breakfastIcon", title: "mic-dejun")
                ButonMeniuAdaugareView(imageName: "lunchIcon", title: "pranz")
                ButonMeniuAdaugareView(imageName: "dinnerIcon", title: "cina")
                ButonMeniuAdaugareView(imageName: "snacksIcon", title: "gustari")

            }.frame(maxWidth: .infinity)
            HStack{
                ButonMeniuAdaugareView(imageName: "sportsIcon", title: "sport")
                ButonMeniuAdaugareView(imageName: "weightIcon", title: "greutate")
                ButonMeniuAdaugareView(imageName: "waterIcon", title: "lichide")
            }.frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color(UIColor.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .padding([.top, .leading, .trailing])
        .padding(.bottom)
        .shadow(color: Color.black.opacity(0.4), radius: 12)
    }
    
}

struct MeniuAdaugareView_Previews: PreviewProvider {
    static var previews: some View {
        MeniuAdaugareView()
    }
}
