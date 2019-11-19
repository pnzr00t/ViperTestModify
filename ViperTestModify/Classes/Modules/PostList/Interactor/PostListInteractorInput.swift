//
//  PostListPostListInteractorInput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import Foundation

protocol PostListInteractorInput {
    /**
        @author pnzr00t
        Get Post info by row and section
    */
    func getPostInfo(sectionIndex: Int, rowIndex: Int) -> PostInfo?
    
    
    /**
        @author pnzr00t
        Number of setion in table
    */
    func numberOfSections() -> Int
    
    /**
        @author pnzr00t
        Create new post
    */
    func numberOfItems(in section: Int) -> Int
    
    
    /**
        @author pnzr00t
        Delete post
    */
    func deletePostInfo(sectionIndex: Int, rowIndex: Int)
    

    /**
        @author pnzr00t
        Get service container
    */
    func getServiceContainer() -> ServiceContainerProtocol?
}
