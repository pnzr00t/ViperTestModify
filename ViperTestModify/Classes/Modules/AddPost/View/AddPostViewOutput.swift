//
//  AddPostAddPostViewOutput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

protocol AddPostViewOutput {

    /**
        @author pnzr00t
        Notify presenter that view is ready
    */
    func viewIsReady()
    
    /**
        @author pnzr00t
        Save post by UID
    */
    func savePostInfo(postInfo: PostInfo)
}
