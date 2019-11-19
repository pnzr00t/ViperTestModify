//
//  ServiceContainerProtocol.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 13.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import Foundation

protocol ServiceContainerProtocol: class {
    /**
        @author pnzr00t
        Get ServiceContainer service object for interactor for PostListModel
    */
    func getPostInfoDataService() -> GetDataServiceProtocol

    /**
        @author pnzr00t
        Get ServiceContainer service object for interactor for AddPostModel
    */
    func getAddPostDataService() -> AddPostDataServiceProtocol
}
