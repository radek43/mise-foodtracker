//
//  DishButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 15.04.2022.
//

import SwiftUI

struct DishButton: View {
    // MARK: - PROPERTIES
    var imageName: String
    var title: String
    private var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
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
                        .frame(width: idiom == .pad ? 48 : getScreenBounds().width * 0.12, height: idiom == .pad ? 48 : getScreenBounds().width * 0.12)
                )
            // Dish text
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.primary)
                .multilineTextAlignment(.center)
                .frame(height: 40)
        }
        .padding(9)
    }
}
// MARK: - PREVIEW
struct DishButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DishButton(imageName: "breakfast", title: "mic \ndejun")
            DishButton(imageName: "breakfast", title: "mic \ndejun")
                .preferredColorScheme(.dark)
        }
    }
}
