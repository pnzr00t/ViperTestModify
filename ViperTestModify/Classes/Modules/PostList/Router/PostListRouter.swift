//
//  PostListPostListRouter.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//
import UIKit

class PostListRouter: PostListRouterInput {

    

    weak var view: PostListViewInput! // Crutch for viewcontroller dismiss
    
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.view.makeDismiss(animated: flag, completion: completion)
    }

    /**
        @author pnzr00t
        Edit post by ID
    */
    func editPost(postInfo: PostInfo? = nil, serviceContainer: ServiceContainerProtocol?) {  // TODO: Remove or refactor this method
        guard let addPostViewController = UIStoryboard(name: "AddPost", bundle: nil).instantiateViewController(identifier: "AddPostViewControllerID") as? AddPostViewController else { print("AddPost.StoryBoard Instantiate problem", #function); return }
        
        let addPostConfigurator = AddPostModuleConfigurator(postInfo: postInfo)
        addPostConfigurator.configureModuleForViewInput(viewInput: addPostViewController, serviceContainer: serviceContainer)
    
        self.view.presentViewControllerInput(addPostViewController, animated: true, completion: nil)
    }
}
