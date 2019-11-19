//
//  AddPostAddPostViewInput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

protocol AddPostViewInput: class {

    /**
        @author pnzr00t
        Setup initial state of the view
    */
    func setupInitialState()
    
    
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)?)
    
    
    /**
        @author pnzr00t
        Init text field - PostTitle
    */
    func initPostTitle(postTitle: String)
    
    
    /**
        @author pnzr00t
        Init text field - PostContent
    */
    func initPostContent(postContent: String)    
}
