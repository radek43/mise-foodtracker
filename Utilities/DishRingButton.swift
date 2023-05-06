//
//  DishRingButton.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 22.12.2022.
//

import SwiftUI


struct DishRingButton: View {
    // MARK: - PROPERTIES
    private var idiom: UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    var title: String
    var calories: Int
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                // Main circle
                Circle()
                    .stroke(Color.primary.opacity(0.2), style: StrokeStyle(lineWidth: 0))
                    .background(Circle().fill(Color.button))
                
                // Progress ring
                Circle()
                    .stroke(Color.accent, style: StrokeStyle(lineWidth: 3))

                // Food log meta
                VStack(alignment: .center, spacing: 0.0) {
                    Text("\(calories)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("kCal")
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
            }
            .frame(width: idiom == .pad ? 48 : getScreenBounds().width * 0.12, height: idiom == .pad ? 48 : getScreenBounds().width * 0.12)
            
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
struct DishRingButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                DishRingButton(title: "prânz", calories: 453)
            }
            
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                DishRingButton(title: "prânz", calories: 453)
                    .preferredColorScheme(.dark)
            }
        }
    }
}