//
//  TitleWithButton.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI
import Kingfisher

struct TitleWithButton: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var numeTitlu: String

    init(numeTitlu: String) {
        self.numeTitlu = numeTitlu
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
                    if let user = authViewModel.currentUser {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 36, height: 36)
                            .padding(6)
                        
                    } else {
                        Circle()
                            .frame(width: 36, height: 36)
                            .foregroundColor(Color.secondary)
                            .padding(6)
                            
                    }
                }
            }
            .padding([.top, .leading, .trailing], 25.0)
            

        }
        //.frame(width: UIScreen.main.bounds.width * 0.9)
        
        
    }
}

// MARK: - PREVIEW

struct TitleWithButton_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithButton(numeTitlu: "Test")
            .environmentObject(AuthViewModel())
    }
}
