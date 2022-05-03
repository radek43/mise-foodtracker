//
//  ButonMeniuAdaugareView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/15/22.
//

import SwiftUI
import SwiftUISegues

struct ButonMeniuAdaugareView: View {
    var imageName: String
    var title: String
    
    init(imageName: String, title: String) {
            self.imageName = imageName // assign all the parameters, not only `content`
            self.title = title
        }
    
    var body: some View {
        VStack{
            NavigationLink(destination: AddFoodView()) {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(UIColor.label))
                    .clipShape(Circle())
                    .overlay(Image(imageName))
            }

            Text(title)
                .multilineTextAlignment(.center)
        }
        .padding(10)
    }
}

struct ButonMeniuAdaugareView_Previews: PreviewProvider {
    static var previews: some View {
        ButonMeniuAdaugareView(imageName: "person.2", title: "text")
    }
}
