//
//  PostListPostListPresenter.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

class PostListPresenter: PostListModuleInput, PostListInteractorOutput {
    weak var view: PostListViewInput!
    var interactor: PostListInteractorInput!
    var router: PostListRouterInput!

    func viewIsReady() {
    }
}


// MARK: OutputViewController. 
extension PostListPresenter: PostListViewOutput
{
    /**
        @author pnzr00t
        Update table if info is changed
    */
    func updateTable() {
        self.view.updateTable()
    }
    
    
    // MARK: Router methods
    /**
        @author pnzr00t
        edit post
    */
    func onPushEditPost(postInfo: PostInfo) {
        self.router.editPost(postInfo: postInfo, serviceContainer: self.interactor.getServiceContainer())
    }
    
    /**
        @author pnzr00t
        Create new post
    */
    func onPushCreateNewPost() {
        self.router.editPost(postInfo: nil, serviceContainer: self.interactor.getServiceContainer())
    }
    
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.router.makeDismiss(animated: flag, completion: completion)
    }
    
    
    
    
    
    // MARK: Iteractor data getting
    /**
        @author pnzr00t
        Number of setion in table
    */
    func numberOfSections() -> Int {
        return self.interactor.numberOfSections()
    }
    
    /**
        @author pnzr00t
        Create new post
    */
    func numberOfItems(in section: Int) -> Int {
        return self.interactor.numberOfItems(in: section)
    }
    
    /**
        @author pnzr00t
        Get Post info by row and section
    */
    func getPostInfo(sectionIndex: Int, rowIndex: Int) -> PostInfo? {
        return self.interactor.getPostInfo(sectionIndex: sectionIndex, rowIndex: rowIndex)
    }
    
    
    /**
        @author pnzr00t
        Delete post
    */
    func deletePostInfo(sectionIndex: Int, rowIndex: Int) {
        self.interactor.deletePostInfo(sectionIndex: sectionIndex, rowIndex: rowIndex)
    }
}



