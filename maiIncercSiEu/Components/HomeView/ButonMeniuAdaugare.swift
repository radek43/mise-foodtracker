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
    
    // All the routes that lead from this view to the next ones
    enum Route: Hashable {
        case pushTest, modalTest, popoverTest
    }
    
    // Triggers segues when its values are changes
    @State private var route: Route? = nil
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
                
                Button(action: {
                    route = .popoverTest})
                {
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(UIColor.label))
                        .clipShape(Circle())
                        .overlay(Image(imageName))
                    
                }
                Text(title)
                    .font(.system(size: 15 + size, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.01)
                
                    
            }
            .padding(10)
            .segue(.popover(.rect(.bounds), .top), tag: .popoverTest, selection: $route) {
                AddFoodView()
           //         Button("Welcome to modal") {
           //             route = nil
           //         }
            }
    }
}

// MARK: - PREVIEW

struct ButonMeniuAdaugare_Previews: PreviewProvider {
    static var previews: some View {
        ButonMeniuAdaugare(imageName: "sportsIcon", title: "sport")
    }
}
