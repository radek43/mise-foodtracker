//
//  CommunityReply.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/8/22.
//

import SwiftUI

struct CommunityReply: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.secondary)
                    .padding(.trailing, 5)

                VStack(alignment: .leading) {
                    Text("@numeutilizator")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("• acum 5 minute")
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                        .padding(.bottom, 3)
                }

                Spacer()
                
            }
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                .font(.callout)
                .multilineTextAlignment(.leading)

            Divider()
        }
        .padding([.leading, .bottom, .trailing])
    }
}

struct CommunityReply_Previews: PreviewProvider {
    static var previews: some View {
        CommunityReply()
    }
}