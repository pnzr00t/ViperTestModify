//
//  PostListPostListModuleInput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

protocol PostListModuleInput: class {
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)?)
}
