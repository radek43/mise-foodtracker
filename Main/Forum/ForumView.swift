//
//  ForumView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct ForumView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel = ForumViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    // Titlu
//                        PullToRefresh(coordinateSpaceName: "pullToRefresh") {
//                            viewModel.fetchPosts()
//                        }
                    VStack {
                        
                        HStack {
                            Text("Categorie")
                                .padding(.leading)
                            Spacer()
                            Text("Sorteaza")
                                .padding(.trailing)
                        }.padding(.horizontal)
                        
                        ForEach(viewModel.posts) { post in
                            NavigationLink(destination: PostDetail(post: post)){
                               PostRow(post: post)
                                    .foregroundColor(.primary)
                                    .padding(.horizontal)
                           }
                        }
                    }
                }
//                .coordinateSpace(name: "pullToRefresh")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            AddNewPost()
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            //
                        } label: {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                }
            }
            .navigationTitle("Comunitate")
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}
