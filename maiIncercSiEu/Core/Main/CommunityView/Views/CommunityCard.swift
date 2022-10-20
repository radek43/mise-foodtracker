//
//  CommunityCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/28/22.
//

import SwiftUI

struct CommunityCard: View {
    // MARK: - PROPERTIES
    
    let post: Post
    
    // MARK: - BODY
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
                        Text(post.titluPostare)
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
                    
                    Text(post.continutPostare)
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


// MARK: - PREVIEW
struct CommunityCard_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCard(post: Post.dummyData[1])
    }
}
