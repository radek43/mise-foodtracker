//
//  SettingsRow.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation
import SwiftUI


struct SettingsRow: View {
    // MARK: - PROPERTIES
    var iconDefault: String?
    var iconAsset: String?
    var firstText: String
    var color: Color

    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                if (iconDefault != nil) {
                    Image(systemName: iconDefault!)
                        .foregroundColor(Color.white)
                }
                if (iconAsset != nil) {
                    Image(iconAsset!)
                        .foregroundColor(Color.white)
                }
            }
            .frame(width: 32, height: 32, alignment: .center)
            Text(firstText)
                .foregroundColor(Color.primary)
            Spacer()
        }
        .padding([.top, .bottom, .trailing], 3)
    }
}


// MARK: - PREVIEW
struct SettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                SettingsRow(iconAsset: "sport", firstText: "Application", color: .secondary)
                    .padding()
            }
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                SettingsRow(iconAsset: "sport", firstText: "Application", color: .secondary)
                    .padding()
                    .preferredColorScheme(.dark)
            }
        }
    }
}

