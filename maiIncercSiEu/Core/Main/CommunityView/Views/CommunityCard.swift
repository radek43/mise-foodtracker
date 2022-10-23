//
//  CommunityCard.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 9/28/22.
//

import SwiftUI
import Kingfisher

struct CommunityCard: View {
    // MARK: - PROPERTIES
    
    let post: Post
    
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            if let user = post.user {
                HStack(alignment: .top) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.secondary)
                        .padding(.trailing, 5)

                    VStack(alignment: .leading) {
                        Text(post.titluPostare)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        Text("@" + user.username)
                            .font(.footnote)
                            .padding(.bottom, 3)
                        
                        Text(post.continutPostare.replacingOccurrences(of: "\n", with: ""))
                            .lineLimit(2)
                            .font(.footnote)
                            .padding(.bottom, 3)
                            .multilineTextAlignment(.leading)
                    }
                }
            } else {
                HStack(alignment: .top) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.secondary)
                        .padding(.trailing, 5)

                    VStack(alignment: .leading) {
                        Text(post.titluPostare)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        Text("@numeutilizator")
                            .font(.footnote)
                            .padding(.bottom, 3)
                        
                        Text(post.continutPostare.replacingOccurrences(of: "\n", with: ""))
                            .lineLimit(2)
                            .font(.footnote)
                            .padding(.bottom, 3)
                            .multilineTextAlignment(.leading)
                            
                            
                    }
                }
            }

            
            HStack {
                Text("• 4 aprecieri")

                Text("• 3 comentarii")

                Spacer()
                
                Text("12/03/2022")
                    
            }
            .foregroundColor(Color.secondary)
            .font(.footnote)
        }
        .modifier(MakeCard())
    }
}


// MARK: - PREVIEW
struct CommunityCard_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCard(post: Post.dummyData[0])
    }
}
