//
//  AddPostAddPostViewController.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {

    var output: AddPostViewOutput!
    
    // MARK: ViewController Outlets
    @IBOutlet weak var postTitleUITextField: UITextField!
    @IBOutlet weak var postContentUITextView: UITextView!
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }



    
    /**
        @author pnzr00t
        Make view dismiss
    */
    func makeDismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: flag)
        } else
        {
            self.dismiss(animated: flag, completion: completion)
        }
    }
}

// MARK: Extension with actions
extension AddPostViewController {
    @IBAction func onSavePushButton(_ sender: UIBarButtonItem) {
        guard let postTitle = self.postTitleUITextField.text else {
            print("Cant let postTitle", #function)
            return
        }
        guard let postContent = self.postContentUITextView.text else {
            print("Cant let postContent", #function)
            return
        }
        
        let postInfo = PostInfo(postTitle: postTitle, postContent: postContent)
        self.output.savePostInfo(postInfo: postInfo)
    }
}


// MARK: Extension with AddPostViewInput
extension AddPostViewController: AddPostViewInput {
    func initPostTitle(postTitle: String) {
        self.postTitleUITextField.text = postTitle
    }
    
    func initPostContent(postContent: String) {
        self.postContentUITextView.text = postContent
    }
    
    // MARK: AddPostViewInput
    func setupInitialState() {
    }
}
