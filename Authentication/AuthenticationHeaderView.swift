//
//  AuthenticationHeaderView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 8/9/22.
//

import SwiftUI


struct AuthenticationHeaderView: View {
    // MARK: - PROPERTIES
    let title1: String
    let title2: String
    @State var show = false
    
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
        .frame(height: 260)
        .padding(.leading)
        .background(
            ZStack{
                Image("Blob1")
                    .resizable()
                    .offset(x: -50, y: -70)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600, height: 600)
                    .rotationEffect(Angle(degrees: show ? 360 + 90 : 90))
                    .blendMode(.overlay)
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
                    .blendMode(.overlay)
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
        .clipShape(RoundedShape(corners: [.bottomRight], cornerRadius: 80))
    }
}

// MARK: - PREVIEW
struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthenticationHeaderView(title1: "Welcome", title2: "Back")
            AuthenticationHeaderView(title1: "Welcome", title2: "Back")
                .preferredColorScheme(.dark)
        }
    }
}

