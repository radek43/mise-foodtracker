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
    var secondText: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text(firstText)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondText)
        }
    }
}

// MARK: - PREVIEW

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRow(icon: "gear", firstText: "Application", secondText: "To-Do")
    }
}
