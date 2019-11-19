//
//  PostTableViewCell.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 10.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postTitleUILabel: UILabel!
    @IBOutlet weak var postTextUILabel: UILabel!
    
    private var postInfo: PostInfo? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configurateCell(postInfo: PostInfo) {
        self.postInfo = postInfo
        
        self.postTitleUILabel.text = postInfo.postTitle
        self.postTextUILabel.text = postInfo.postContent
    }
    
    func getPostInfo() -> PostInfo? {
        return self.postInfo
    }
}
