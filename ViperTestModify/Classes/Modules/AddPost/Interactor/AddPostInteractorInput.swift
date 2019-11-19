//
//  AddPostAddPostInteractorInput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import Foundation

protocol AddPostInteractorInput {
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
