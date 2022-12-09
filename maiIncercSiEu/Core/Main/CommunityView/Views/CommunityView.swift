//
//  CommunityView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct CommunityView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject var viewModel = CommunityViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView {
                        //Titlu
//                        PullToRefresh(coordinateSpaceName: "pullToRefresh") {
//                            viewModel.fetchPosts()
//                        }

                        VStack {
                            ForEach(viewModel.posts) { post in
                                NavigationLink(destination: CommunityViewDetail(post: post)){
                                   CommunityCard(post: post)
                                        .foregroundColor(.primary)
                                        .padding(.horizontal)
                               }
                            }
                        }
                    }
                    .coordinateSpace(name: "pullToRefresh")
                }
                .toolbar(content: {
                    NavigationLink {
                        CommunityAddPost()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                            .frame(width: 36, height: 36)
                    }
                })
                .navigationTitle("Comunitate")
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
    }
}

// MARK: - PREVIEW

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
