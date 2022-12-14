//
//  SettingsRow.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/28/22.
//

import SwiftUI

struct SettingsRow: View {
    // MARK: - PROPERTIES
    var icon: String
    var firstText: String
    var color: Color
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            }
            .frame(width: 32, height: 32, alignment: .center)
            Text(firstText)
                .foregroundColor(Color.primary)
            Spacer()
        }
    }
}

// MARK: - PREVIEW
struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(icon: "gear", firstText: "Application", color: .secondary)
    }
}
