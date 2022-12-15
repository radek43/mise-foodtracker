//
//  SettingsRow.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/28/22.
//

import SwiftUI

struct SettingsRow: View {
    // MARK: - PROPERTIES
    var iconDefault: String?
    var iconAsset: String?
    var firstText: String
    var color: Color
    var hasChevron = true
    
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
            if hasChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

// MARK: - PREVIEW
struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(iconAsset: "figure.run", firstText: "Application", color: .secondary)
    }
}
