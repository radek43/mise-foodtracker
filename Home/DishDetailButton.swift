//
//  DishDetailButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.01.2023.
//

import SwiftUI

struct DishDetailButton: View {
    // MARK: - PROPERTIES
    var imageName: String
    var propertyTitle: String
    var propertyValue: String
    
    private var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    init(imageName: String, propertyTitle: String, propertyValue: String) {
        self.imageName = imageName // assign all the parameters, not only `content`
        self.propertyTitle = propertyTitle
        self.propertyValue = propertyValue
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // Dish icon
            Circle()
                .stroke(Color.button, style: StrokeStyle(lineWidth: 5))
                .frame(width: idiom == .pad ? 48 : getScreenBounds().width * 0.12, height: idiom == .pad ? 48 : getScreenBounds().width * 0.12)
                .foregroundColor(Color(UIColor.label))
                .background(Circle().fill(Color.button))
                .clipShape(Circle())
                .overlay(
                    Image(imageName)
                        .font(Font.title.weight(.light))
                )
            // Dish properties
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

// MARK: - PREVIEWS
struct DishDetailButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
            DishDetailButton(imageName: "pastaDish", propertyTitle: "nr. portii", propertyValue: "3.0")
                .preferredColorScheme(.dark)
        }
    }
}
