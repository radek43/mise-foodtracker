//
//  PostService.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/9/22.
//

import Foundation
import Firebase

struct PostService {
    
    func uploadPost(titluPostare: String, continutPostare: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "titluPostare": titluPostare,
                    "continutPostare": continutPostare,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("posts")
            .document().setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
}
