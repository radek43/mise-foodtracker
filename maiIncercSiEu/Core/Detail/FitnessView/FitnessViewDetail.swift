//
//  FitnessViewDetail.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/4/22.
//

import SwiftUI

struct FitnessViewDetail: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 30) {
                Text("Fandari Bulgaresti")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Image("exercitiu")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}


struct FitnessViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        FitnessViewDetail()
    }
}
