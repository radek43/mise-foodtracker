//
//  PhotoSelectorView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/28/22.
//

import SwiftUI

struct PhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Incarca o poza de profil", title2: "")
            
            Button {
                print("Image here")
            } label: {
                VStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 180, height: 180)
                    Text("Adauga o imagine")
                }
                .padding(.top, 44)
      
            }

            
            Spacer()
        }
        .ignoresSafeArea()
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectorView()
    }
}
