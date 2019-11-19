//
//  PostListPostListPresenterTests.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import XCTest

class PostListPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: PostListInteractorInput {

    }

    class MockRouter: PostListRouterInput {

    }

    class MockViewController: PostListViewInput {

        func setupInitialState() {

        }
    }
}
