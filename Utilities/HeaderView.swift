//
//  HeaderView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.08.2022.
//

import SwiftUI


struct HeaderView: View {
    // MARK: - PROPERTIES
    let title1: String
    let title2: String
    
    @State private var show = false
    
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Spacer()
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom)
        }
        .frame(height: 275)
        .padding(.leading, 20)
        .padding(.bottom, 8)
        .background(
            ZStack{
                Image("Blob1")
                    .resizable()
                    .offset(x: -50, y: -70)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600, height: 600)
                    .rotationEffect(Angle(degrees: show ? 360 + 90 : 90))
                    .blendMode(.color)
                    .animation(Animation.linear(duration: 60).repeatForever())
                    .onAppear {
                        self.show = true
                    }
                Image("Blob3")
                    .resizable()
                    .offset(x: -90, y: -100)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                    .rotationEffect(Angle(degrees: show ? -90 : 0), anchor: .topTrailing)
                    .blendMode(.normal)
                    .animation(Animation.linear(duration: 50).repeatForever())
                Image("Blob2")
                    .resizable()
                    .offset(x: -90, y: -100)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .rotationEffect(Angle(degrees: show ? 130 : 0), anchor: .top)
                    .blendMode(.overlay)
                    .animation(Animation.linear(duration: 40).repeatForever())
            }
        )
        .background(Color.accent)
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight, .bottomLeft], cornerRadius: 40))
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title1: "Welcome", title2: "Back")
            HeaderView(title1: "Welcome", title2: "Back")
                .preferredColorScheme(.dark)
        }
    }
}

