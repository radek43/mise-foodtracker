//
//  ButonMeniuAdaugareView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/15/22.
//

import SwiftUI
import SwiftUISegues

struct ButonMeniuAdaugare: View {
    
    // MARK: - PROPERTIES

    @ScaledMetric var size: CGFloat = 1
    
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
                    .stroke(lineWidth: 0)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(UIColor.label))
                    .background(Circle().fill(Color("ColorBackground")))
                    .clipShape(Circle())
                    .overlay(Image(imageName))

                Text(title)
                    .font(.system(size: 15 + size, weight: .medium, design: .rounded))
                    .foregroundColor(Color.primary)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.01)
            }
            .padding(10)
    }
}

// MARK: - PREVIEW

struct ButonMeniuAdaugare_Previews: PreviewProvider {
    static var previews: some View {
        ButonMeniuAdaugare(imageName: "sportsIcon", title: "sport")
    }
}
