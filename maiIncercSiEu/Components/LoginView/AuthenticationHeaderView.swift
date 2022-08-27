//
//  AuthenticationHeaderView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/9/22.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    
    // MARK: - PROPERTIES
    
    let title1: String
    let title2: String
    
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
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

// MARK: - PREVIEW

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeaderView(title1: "Welcome", title2: "Back")
    }
}

