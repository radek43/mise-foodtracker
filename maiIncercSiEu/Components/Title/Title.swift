//
//  Title.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct Title: View {
    
    var numeTitlu: String

    init(numeTitlu: String) {
        self.numeTitlu = numeTitlu
    }
    
    var body: some View {
        HStack {
            Text(numeTitlu)
                .font(.largeTitle.bold())

            Spacer()
            
        }
        .padding([.top, .leading, .trailing], 25.0)
        

    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(numeTitlu: "test")
    }
}
