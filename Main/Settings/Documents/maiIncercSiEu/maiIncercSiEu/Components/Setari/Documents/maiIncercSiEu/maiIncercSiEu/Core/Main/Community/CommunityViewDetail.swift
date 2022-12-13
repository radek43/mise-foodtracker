//
//  CommunityViewDetail.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/7/22.
//

import SwiftUI
import Kingfisher

struct CommunityViewDetail: View {
    // MARK: - PROPERTIES
    
    let post: Post
    
    // MARK: - BODY
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    if let user = post.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.secondary)
                            .padding(.trailing, 5)
                        
                        VStack(alignment: .leading) {
                            Text(post.titluPostare)
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            Text("@" + user.username)
                                .font(.footnote)
                        }
                        
                    } else { //dummy data for preview
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.secondary)
                            .padding(.trailing, 5)

                        VStack(alignment: .leading) {
                            Text(post.titluPostare)
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            Text("@numeutilizator")
                                .font(.footnote)
                        }
                    }
    
                    Spacer()
                    
                }
                .padding(.bottom, 6.0)
                
                Text(post.continutPostare)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    
                HStack {
                    Button {
                        print("Buton de like apasat")
                    } label: {
                        Image(systemName: "heart")
                        Text("Apreciaza")
                            .font(.footnote)
                    }
                    .padding(.trailing)
                    
                    Button {
                        print("Buton de comentariu apasat")
                    } label: {
                        Image(systemName: "bubble.left")
                        Text("Comentariu")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Text("12/03/2022")
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                }
                .padding([.top, .bottom, .trailing], 3)
                
            }
            .padding(.horizontal)
 
            Divider()

            HStack {
                Text("• 3 comentarii")
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
                
                Spacer()
            }
            .padding(.leading)

            CommunityReply()
            CommunityReply()
            CommunityReply()
            
            Spacer()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        //.background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

// MARK: - PREVIEW
struct CommunityViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CommunityViewDetail(post: Post.dummyData[1])
    }
}
