//
//  AddPostDataSericeProtocol.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 12.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import Foundation



protocol AddPostDataServiceProtocol: class {
    /**
        @author pnzr00t
        Get Post info by UID
    */
    func getPostInfo(uid: String) -> PostInfo?
    
    /**
        @author pnzr00t
        Save post by UID
    */
    func savePostInfo(postInfo: PostInfo)
}
