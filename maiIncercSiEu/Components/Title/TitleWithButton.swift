//
//  TitleWithButton.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct TitleWithButton: View {
    
    // MARK: - PROPERTIES
    
    var numeTitlu: String
    var numeIcon: String

    init(numeTitlu: String, numeIcon: String) {
        self.numeTitlu = numeTitlu
        self.numeIcon = numeIcon
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HStack {
                Text(numeTitlu)
                    .font(.largeTitle.bold())

                Spacer()

                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                
            }
            .padding([.top, .leading, .trailing], 25.0)
            
            Spacer()
        }
        //.frame(width: UIScreen.main.bounds.width * 0.9)
        
        
    }
}

// MARK: - PREVIEW

struct TitleWithButton_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithButton(numeTitlu: "Test", numeIcon: "person.crop.circle")
    }
}
