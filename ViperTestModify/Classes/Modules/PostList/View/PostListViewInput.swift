//
//  PostListPostListViewInput.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//
import  UIKit

protocol PostListViewInput: class {

    /**
        @author pnzr00t
        Setup initial state of the view
    */
    func setupInitialState()
    
    
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)?)
    
    /**
        @author pnzr00t
        Present view controller
    */
    func presentViewControllerInput(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    
    
    /**
        @author pnzr00t
        Update table if info is changed
    */
    func updateTable()
}
