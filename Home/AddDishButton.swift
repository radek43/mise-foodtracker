//
//  AddDishButton.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/15/22.
//

import SwiftUI
import SwiftUISegues

struct AddDishButton: View {
    // MARK: - PROPERTIES
    var imageName: String
    var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName // assign all the parameters, not only `content`
        self.title = title

    }
    // MARK: - BODY
    var body: some View {
            VStack {
                Circle()
                    .stroke(Color.button, style: StrokeStyle(lineWidth: 5))
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color(UIColor.label))
                    .background(Circle().fill(Color.button))
                    .clipShape(Circle())
                    .overlay(
                        Image(imageName)
                            .font(Font.title.weight(.light))
                    )
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
struct AddDishButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddDishButton(imageName: "breakfast", title: "mic \ndejun")
            AddDishButton(imageName: "breakfast", title: "mic \ndejun")
                .preferredColorScheme(.dark)
        }
    }
}