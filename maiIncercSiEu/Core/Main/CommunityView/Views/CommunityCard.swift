//
//  CommunityCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/28/22.
//

import SwiftUI

struct CommunityCard: View {
    var body: some View {
        VStack{
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.secondary)
                    .padding(.trailing, 5)

                VStack(alignment: .leading) {
                    HStack {
                        Text("Titlu Postare")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("12/03/2022")
                            .font(.footnote)
                            .foregroundColor(Color.secondary)
                    }
                    
                    Text("@numeutilizator")
                        .font(.footnote)
                        .padding(.bottom, 3)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .lineLimit(3)
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                }
                Spacer()
            }
    
        }
        .modifier(MakeCard())
    }
}

struct CommunityCard_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCard()
    }
}
