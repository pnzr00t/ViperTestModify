//
//  GetDataServiceProtocol.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 11.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import Foundation

protocol GetDataServiceProtocol: class {
    /**
        @author pnzr00t
        Get Post info by row and section
    */
    func getPostInfo(sectionIndex: Int, rowIndex: Int) -> PostInfo
    
    
    
    
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
        Delete post info
    */
    func deletePostInfo(sectionIndex: Int, rowIndex: Int)
}
