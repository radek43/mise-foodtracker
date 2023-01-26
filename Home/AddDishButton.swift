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
                    .stroke(Color("ButtonColor"), style: StrokeStyle(lineWidth: 5))
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color(UIColor.label))
                    .background(Circle().fill(Color("ButtonColor")))
                    .clipShape(Circle())
                    .overlay(
                        Image(imageName)
                            .font(Font.title.weight(.light))
                    )
                Text(title)
                    .font(.system(size: 15, weight: .medium, design: .default))
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
        AddDishButton(imageName: "micDejunOutline", title: "mic \ndejun")
    }
}
