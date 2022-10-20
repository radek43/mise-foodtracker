//
//  CommunityFeedViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/20/22.
//

import Foundation

class CommunityFeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    let service = PostService()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        service.fetchPosts { posts in
            self.posts = posts
        }
    }
}
