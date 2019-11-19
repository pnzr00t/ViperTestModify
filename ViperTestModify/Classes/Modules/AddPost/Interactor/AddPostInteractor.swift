//
//  AddPostAddPostInteractor.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

class AddPostInteractor {

    weak var output: AddPostInteractorOutput!
    
    weak var serviceContainer: ServiceContainerProtocol? = nil // TODO: Remove or refactor this method
    
    private weak var dataService: AddPostDataServiceProtocol?


    func initDataService(dataService: AddPostDataServiceProtocol?) {
        self.dataService = dataService
    }
}

extension AddPostInteractor: AddPostInteractorInput {
    func savePostInfo(postInfo: PostInfo) {
        self.dataService?.savePostInfo(postInfo: postInfo)
    }
    
    func getPostInfo(uid: String) -> PostInfo? {
        return self.dataService?.getPostInfo(uid: uid)
    }
}
