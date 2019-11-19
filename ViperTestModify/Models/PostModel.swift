//
//  PostModel.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 10.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import Foundation

struct PostInfo {
    let postUID: String
    let postTitle: String
    let postContent: String
    let postDate: Date
    
    init(postUID: String = UUID().uuidString, postTitle: String, postContent: String, postDate: Date = Date()) {
        self.postUID = postUID
        self.postTitle = postTitle
        self.postContent = postContent
        self.postDate = postDate
    }
}
