//
//  IconTest.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/4/22.
//

import SwiftUI

struct IconTest: View {
    var body: some View {
        ZStack {
            Image(systemName: "person.crop.circle")
                .font(.largeTitle)
                .foregroundColor(.blue)
            .frame(width: 48, height: 48)
            
            Circle()
                .frame(width: 36, height: 36)
                .padding(6)
        }
        
        
    }
}

struct IconTest_Previews: PreviewProvider {
    static var previews: some View {
        IconTest()
    }
}
