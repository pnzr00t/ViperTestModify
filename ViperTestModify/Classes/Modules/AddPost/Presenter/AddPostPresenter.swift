//
//  AddPostAddPostPresenter.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

class AddPostPresenter: AddPostModuleInput, AddPostInteractorOutput {
    weak var view: AddPostViewInput!
    var interactor: AddPostInteractorInput!
    var router: AddPostRouterInput!
    
    private var postInfo: PostInfo? = nil

    func viewIsReady() {
        if let letPostInfo = self.postInfo {
            self.view.initPostTitle(postTitle: letPostInfo.postTitle)
            self.view.initPostContent(postContent: letPostInfo.postContent)
        } else
        {
            self.view.initPostTitle(postTitle: "")
            self.view.initPostContent(postContent: "")
        }
    }
    
    func initPostInfoForModify(postInfo: PostInfo?) {
        self.postInfo = postInfo
    }

}


// MARK: AddPostViewOutput
extension AddPostPresenter: AddPostViewOutput {
    func savePostInfo(postInfo: PostInfo) {
        if let letPostInfo = self.postInfo {
            let postInfoForSave = PostInfo(postUID: letPostInfo.postUID, postTitle: postInfo.postTitle, postContent: postInfo.postContent, postDate: letPostInfo.postDate) // Old info
            
            self.interactor.savePostInfo(postInfo: postInfoForSave)
        } else
        {
            self.interactor.savePostInfo(postInfo: postInfo)
        }
        
        self.router.makeDismiss(animated: true, completion: nil)
    }
}
