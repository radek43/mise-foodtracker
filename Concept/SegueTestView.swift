//
//  SegueTestView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/5/22.
//

import SwiftUI
import SwiftUISegues

struct SegueTestView: View {
        // All the routes that lead from this view to the next ones
        enum Route: Hashable {
            case pushTest, modalTest, popoverTest
        }
        
        // Triggers segues when its values are changes
        @State private var route: Route? = nil
        
        var imageName: String
        var title: String
    
        init(imageName: String, title: String) {
            self.imageName = imageName // assign all the parameters, not only `content`
            self.title = title
        }
    
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
                    .multilineTextAlignment(.center)
            }
            .padding(10)
            .segue(.popover(.rect(.bounds), .top), tag: .popoverTest, selection: $route) {
                AddFoodView()
//                    Button("Welcome to modal") {
//                        route = nil
//                    }
            }
        }
}

struct SegueTestView_Previews: PreviewProvider {
    static var previews: some View {
        SegueTestView(imageName: "sportsIcon", title: "text")
    }
}
