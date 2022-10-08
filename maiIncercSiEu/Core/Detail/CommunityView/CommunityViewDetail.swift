//
//  CommunityViewDetail.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/7/22.
//

import SwiftUI

struct CommunityViewDetail: View {
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    var body: some View {
        ScrollView{
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
                        Text("Titlu Postare")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("@numeutilizator")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                }
                .padding(.bottom, 6.0)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    
                HStack {
                    Button {
                        print("Buton de like apasat")
                    } label: {
                        Image(systemName: "heart")
                        Text("Like")
                            .font(.footnote)
                    }
                    .padding(.trailing)
                    
                    
                    Button {
                        print("Buton de comentariu apasat")
                    } label: {
                        Image(systemName: "bubble.left")
                        Text("Comment")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Text("12/03/2022")
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
    
                }.padding([.top, .bottom, .trailing], 3)
                
            }
            .padding(.horizontal)
 
            Divider()

            HStack{
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
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

// MARK: - PREVIEW
struct CommunityViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        CommunityViewDetail()
    }
}
