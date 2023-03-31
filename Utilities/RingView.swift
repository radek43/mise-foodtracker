//
//  RingView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/22/22.
//

import SwiftUI

struct RingView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.primary.opacity(0.2), style: StrokeStyle(lineWidth: 0))
                    .background(Circle().fill(Color.button))
                    .frame(width: 48, height: 48)
                Circle()
                    .trim(from: 0.6, to: 1)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2666666667, green: 0.4784313725, blue: 0.5647058824, alpha: 1)), Color(#colorLiteral(red: 0.2274509804, green: 0.4784313725, blue: 0.5647058824, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 4,lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                    )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                
                    .frame(width: 48, height: 48)
                
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
struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
