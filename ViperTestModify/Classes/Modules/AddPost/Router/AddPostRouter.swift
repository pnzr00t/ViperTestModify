//
//  AddPostAddPostRouter.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

class AddPostRouter: AddPostRouterInput {

    weak var view: AddPostViewInput! // Crutch for viewcontroller dismiss

    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.view.makeDismiss(animated: flag, completion: completion)
    }
}
