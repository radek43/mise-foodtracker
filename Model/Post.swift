//
//  Post.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 20.10.2022.
//


struct Post: Identifiable, Decodable {
    var id: String?
    let continutPostare: String
    let likes: Int
//    let timestamp: Timestamp
    let titluPostare: String
    let uid: String
    
    var user: User?
}

extension Post {
    static let dummyData: [Post] = [
        Post(continutPostare: "Postarea mea frumoasa\n\ninca o linie scrisa",
             likes: 12,
//             timestamp: Timestamp(seconds: 2, nanoseconds: 1),
             titluPostare: "Titlul Postarii mele lungi si frumoase la care mi-ar placea sa fie frumos aliniat textul dar ma tem ca nu va fi asa",
             uid: "2jk3hg32kj4hgwkd238y"),
        
        Post(continutPostare: "A doua mea postare frumoasa",
             likes: 23,
//             timestamp: Timestamp(seconds: 3, nanoseconds: 1),
             titluPostare: "A doua mea postare frumoasa",
             uid: "h3g43k2432k4jvh"),
        
        Post(continutPostare: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
             likes: 48,
//             timestamp: Timestamp(seconds: 3, nanoseconds: 1),
             titluPostare: "Lorem Ipsum",
             uid: "h3g43k2432k4jvh")
    ]
}

