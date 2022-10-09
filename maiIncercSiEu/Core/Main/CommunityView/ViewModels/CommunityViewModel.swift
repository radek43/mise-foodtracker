//
//  CommunityViewModel.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/9/22.
//

import Foundation

class CommunityViewModel: ObservableObject {
    
    @Published var didUploadPost = false
    let service = PostService()
    
    func uploadPost(withTitle titluPostare: String, withContent continutPostare: String) {
        
        service.uploadPost(titluPostare: titluPostare, continutPostare: continutPostare) { success in
            if success {
                self.didUploadPost = true
            } else {
                //show error message
            }
        }
        
    }
}



