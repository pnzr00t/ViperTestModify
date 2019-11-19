//
//  PostListPostListViewController.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {

    var output: PostListViewOutput!
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        #if DEBUG
            print(#function)
        #endif
        super.viewDidLoad()
        
        print(#function);
        self.title = "Post List"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.definesPresentationContext = true
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension
        
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.output.updateTable() // Update table (not optimal varint of usage, but simple for study purposal)
        #if DEBUG
            print(#function)
        #endif
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        #if DEBUG
            print(#function)
        #endif
    }



    
   
    
    @IBAction func onPushAddPostButton(_ sender: UIBarButtonItem) {
        self.output.onPushCreateNewPost() // Create new post
    }
}

// MARK: PostListViewInput protocol implementation
extension PostListViewController: PostListViewInput {
    func updateTable() {
        self.tableView.reloadData() // Not perfect, implementation, but for example is cool
    }
    
    // MARK: PostListViewInput
    func setupInitialState() {
        //print(#function);
        self.title = "Post List"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.definesPresentationContext = true
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
    
    
    /**
        @author pnzr00t
        Present view controller
    */
    func presentViewControllerInput(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = self.navigationController {
            navigationController.pushViewController(viewControllerToPresent, animated: true)
        } else
        {
            viewControllerToPresent.presentationController?.delegate = self
            self.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
}

// MARK: UITableViewDataSource
extension PostListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListCellReuseID", for: indexPath) as! PostTableViewCell
        let postInfoItem = self.output.getPostInfo(sectionIndex: indexPath.section, rowIndex: indexPath.row)
        
        if let letPostInfoItem = postInfoItem { // TODO: "nil error" heandling
            cell.configurateCell(postInfo: letPostInfoItem)
        }
        
        return cell
    }
}


extension PostListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellViewController = self.tableView.cellForRow(at: indexPath) as? PostTableViewCell
        
        if let postInfoForEdit = cellViewController?.getPostInfo() {
            self.output.onPushEditPost(postInfo: postInfoForEdit)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.output.deletePostInfo(sectionIndex: indexPath.section, rowIndex: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


extension PostListViewController: UIAdaptivePresentationControllerDelegate {
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController)
    {
      // Only called when the sheet is dismissed by DRAGGING.
      // You'll need something extra if you call .dismiss() on the child.
      // (I found that overriding dismiss in the child and calling
      // presentationController.delegate?.presentationControllerDidDismiss
      // works well).
        
        #if DEBUG
            print(#function)
        #endif
        
        self.output.updateTable() // Update table (not optimal varint of usage, but simple for study purposal)
    }
}
