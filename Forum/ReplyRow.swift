//
//  ReplyRow.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10/8/22.
//

import SwiftUI

struct ReplyRow: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
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
        }
    }
}

// MARK: - PREVIEWS
struct CommunityReply_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReplyRow()
            ReplyRow()
                .preferredColorScheme(.dark)
        }
    }
}
