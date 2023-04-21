//
//  PostRow.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 9/28/22.
//

import SwiftUI

struct PostRow: View {
    // MARK: - PROPERTIES
    let post: Post
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            if let user = post.user {
                HStack(alignment: .top) {
                    //                    KFImage(URL(string: user.profileImageUrl))
                    //                        .resizable()
                    //                        .scaledToFill()
                    //                        .clipShape(Circle())
                    //                        .frame(width: 50, height: 50)
                    //                        .foregroundColor(Color.secondary)
                    //                        .padding(.trailing, 5)
                    
                    VStack(alignment: .leading) {
                        Text(post.titluPostare)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        Text("@\(user.name)")
                            .font(.footnote)
                            .padding(.bottom, 3)
                        
                        Text(post.continutPostare.replacingOccurrences(of: "\n", with: "") + "\n")
                            .lineLimit(2)
                            .font(.footnote)
                            .padding(.bottom, 3)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                HStack {
                    Text(String(post.likes) + " Aprecieri")
                        .font(.footnote)
                    
                    Text(String(post.likes) + " Comentarii") //de remediat
                        .font(.footnote)
                    
                    Spacer()
                    
                    Text("12/04/2022")
                        .font(.footnote)
                }
                .foregroundColor(Color.secondary)
                .font(.footnote)
                
            } else {
                HStack(alignment: .top) {
                    Circle() // placeholder poza de profil
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.button)
                        .padding(.trailing, 5)
                    VStack(alignment: .leading) {
                        //placeholder titlu
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .frame(width: 250, height: 30)
                            .foregroundColor(Color.button)
                        
                        //placeholder username
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 100, height: 10)
                            .foregroundColor(Color.button)
                        
                        //placeholder linie1 continutText
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .frame(width: 250, height: 15)
                            .foregroundColor(Color.button)
                        
                        //placeholder linie2 continutText
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .frame(width: 225, height: 13)
                            .foregroundColor(Color.button)
                    }
                }
                
                HStack {
                    //placeholder aprecieri
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .frame(width: 80, height: 10)
                        .foregroundColor(Color.button)
                    
                    //placeholder comentarii
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .frame(width: 80, height: 10)
                        .foregroundColor(Color.button)
                    
                    Spacer()
                    
                    //placeholder dataPostare
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                        .frame(width: 70, height: 10)
                        .foregroundColor(Color.button)
                }
                .foregroundColor(Color.secondary)
                .font(.footnote)
            }
        }
        .card()
    }
}

// MARK: - PREVIEW
struct CommunityCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForumView()
            ForumView()
                .preferredColorScheme(.dark)
        }
    }
}
