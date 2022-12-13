//
//  ForumViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/9/22.
//

import Foundation

class ForumViewModel: ObservableObject {
    
    @Published var posts = [Post]() //vizualizarea postarilor in view
    @Published var didUploadPost = false // uploadarea postarilor in db
    
    let service = PostService()
    let userService = UserService()
    
    init() {
        fetchPosts()
    }
    
    func uploadPost(withTitle titluPostare: String, withContent continutPostare: String) {
        service.uploadPost(titluPostare: titluPostare, continutPostare: continutPostare) { success in
            if success {
                self.didUploadPost = true
            } else {
                //show error message
            }
            self.didUploadPost = false
        }
    }
    

    
    func fetchPosts() {
        service.fetchPosts { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.posts[i].user = user
                }
            }
        }
    }
}



