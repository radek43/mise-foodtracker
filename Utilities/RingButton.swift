//
//  RingButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 22.12.2022.
//

import SwiftUI


struct RingView: View {
    // MARK: - PROPERTIES
    private var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                // Main circle
                Circle()
                    .stroke(Color.primary.opacity(0.2), style: StrokeStyle(lineWidth: 0))
                    .background(Circle().fill(Color.button))
                    .frame(width: idiom == .pad ? 48 : getScreenBounds().width * 0.12, height: idiom == .pad ? 48 : getScreenBounds().width * 0.12)
                
                // Progress ring
                Circle()
                    .trim(from: 0.6, to: 1)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color.accent, Color.accent]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 4,lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                    )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: idiom == .pad ? 48 : getScreenBounds().width * 0.12, height: idiom == .pad ? 48 : getScreenBounds().width * 0.12)
                
                // Food log meta
                VStack(alignment: .center, spacing: 0.0) {
                    Text("456")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("kCal")
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
            }
            
            Text("pranz")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(Color.primary)
                .multilineTextAlignment(.center)
                .frame(height: 40)
        }
        .padding(9)
    }
}

// MARK: - PREVIEW
struct RingButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                RingView()
            }
            
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                RingView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
