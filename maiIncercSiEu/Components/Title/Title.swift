//
//  Title.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct Title: View {
    
    // MARK: - PROPERTIES
    
    var numeTitlu: String

    // MARK: - BODY
    
    init(numeTitlu: String) {
        self.numeTitlu = numeTitlu
    }
    
    var body: some View {
        HStack {
            Text(numeTitlu)
                .font(.largeTitle.bold())

            Spacer()
            
        }
        .padding([.top, .leading, .trailing])
        

    }
}

// MARK: - PREVIEW

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(numeTitlu: "test")
    }
}
