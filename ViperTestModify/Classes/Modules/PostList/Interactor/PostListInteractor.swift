//
//  PostListPostListInteractor.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

class PostListInteractor {
    weak var output: PostListInteractorOutput!
    
    weak var serviceContainer: ServiceContainerProtocol? = nil // TODO: Remove or refactor this method
    
    private weak var dataService: GetDataServiceProtocol?
    
    init(dataService: GetDataServiceProtocol?) {
        self.dataService = dataService
    }
}


// MARK: PostListInteractorInput
extension PostListInteractor: PostListInteractorInput {
    func getServiceContainer() -> ServiceContainerProtocol? {
        return self.serviceContainer
    }
    
    func deletePostInfo(sectionIndex: Int, rowIndex: Int) {
        self.dataService?.deletePostInfo(sectionIndex: sectionIndex, rowIndex: rowIndex)
    }
    
    func numberOfSections() -> Int {
        guard let numberOfSection = self.dataService?.numberOfSections() else { return 0 }
        return numberOfSection
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard let numberOfItems = self.dataService?.numberOfItems(in: section) else { return 0 }
        return numberOfItems
    }
    
    func getPostInfo(sectionIndex: Int, rowIndex: Int) -> PostInfo? {
        guard let postInfo = self.dataService?.getPostInfo(sectionIndex: sectionIndex, rowIndex: rowIndex) else { return nil }
        return postInfo
    }
}
