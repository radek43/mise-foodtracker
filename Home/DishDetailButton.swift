//
//  DishDetailButton.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 1/10/23.
//

import SwiftUI

struct DishDetailButton: View {
    // MARK: - PROPERTIES
    var imageName: String
    var propertyTitle: String
    var propertyValue: String
    
    init(imageName: String, propertyTitle: String, propertyValue: String) {
        self.imageName = imageName // assign all the parameters, not only `content`
        self.propertyTitle = propertyTitle
        self.propertyValue = propertyValue

    }
    // MARK: - BODY
    var body: some View {
            VStack {
                Circle()
                    .stroke(Color("ButtonColor"), style: StrokeStyle(lineWidth: 5))
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color(UIColor.label))
                    .background(Circle().fill(Color("ButtonColor")))
                    .clipShape(Circle())
                    .overlay(
                        Image(imageName)
                            .font(Font.title.weight(.light))
                    )
                Text(propertyTitle)
                    .font(.footnote)
                    .foregroundColor(Color.primary)
                    .multilineTextAlignment(.center)
                Text(propertyValue)
                    .foregroundColor(Color.primary)
                    .multilineTextAlignment(.center)

            }
            .padding(9)
    }
}

struct DishDetailButton_Previews: PreviewProvider {
    static var previews: some View {
        DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
    }
}
