//
//  GetDataProtocol.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 11.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import Foundation

class GetDataService : GetDataServiceProtocol {

    
    private var postInfoList = [PostInfo]()
    
    init() {
        self.postInfoList.append(PostInfo(postTitle: "Test post", postContent: "Post content\n Post Content2\n Post Content 3\n Post Content 4"))
        self.postInfoList.append(PostInfo(postTitle: "Test post2", postContent: "Post content"))
        self.postInfoList.append(PostInfo(postTitle: "Test post3", postContent: "Post content\n PostInfo2"))
        self.postInfoList.append(PostInfo(postTitle: "Test post4", postContent: "Post content\n PostInfo2\nPost info 3"))
        self.postInfoList.append(PostInfo(postTitle: "Test post5", postContent: "Post content\n PostInfo2\nPost info 3\n Post info 4"))
    }
    
    
    func deletePostInfo(sectionIndex: Int, rowIndex: Int) {
        self.postInfoList.remove(at: rowIndex)
    }
    
    func getPostInfo(sectionIndex: Int, rowIndex: Int) -> PostInfo {
        self.postInfoList[rowIndex]
    }
    

    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return self.postInfoList.count
    }
    
    
}

// MARK: AddPostDataServiceProtocol
extension GetDataService: AddPostDataServiceProtocol {
    func savePostInfo(postInfo: PostInfo) {
        for (indexID, postInfoItem) in self.postInfoList.enumerated() {
            if postInfoItem.postUID == postInfo.postUID {
                self.postInfoList[indexID] = postInfo
                return
            }
        }
        
        self.postInfoList.append(postInfo)
    }
    
    func getPostInfo(uid: String) -> PostInfo? {
        let postInfo = self.postInfoList.first { (postInfo) -> Bool in
            if postInfo.postUID == uid {
                return true
            } else
            {
                return false
            }
        }
        
        return postInfo
    }
}
