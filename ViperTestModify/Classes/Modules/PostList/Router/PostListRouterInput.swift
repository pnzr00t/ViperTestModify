//
//  PostListPostListRouterInput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import Foundation

protocol PostListRouterInput {
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)?)
    
    /**
        @author pnzr00t
        Edit post by ID
    */
    func editPost(postInfo: PostInfo?, serviceContainer: ServiceContainerProtocol?)
}
