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
            ZStack {
                VStack {
                    ScrollView {
                        //Titlu
//                        PullToRefresh(coordinateSpaceName: "pullToRefresh") {
//                            viewModel.fetchPosts()
//                        }
                        VStack {
                            HStack {
                                Text("Comunitate")
                                    .font(.largeTitle.bold())

                                Spacer()

                                NavigationLink {
                                    CommunityAddPost()
                                } label: {
                                    Image("addPostOutline")
                                        .font(.title)
                                    }
                                }
                            }
                            .padding([.top, .leading, .trailing], 25.0)

                        VStack {
                            ForEach(viewModel.posts) { post in
                                NavigationLink(destination: CommunityViewDetail(post: post)){
                                   CommunityCard(post: post)
                                        .foregroundColor(.primary)
                               }
                            }
                        }
                    }
                    .coordinateSpace(name: "pullToRefresh")
                }
            }
            .navigationTitle("Comunitate")
            .navigationBarHidden(true)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
