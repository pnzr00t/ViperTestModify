//
//  PostListPostListConfiguratorTests.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import XCTest

class PostListModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = PostListViewControllerMock()
        let configurator = PostListModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "PostListViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PostListPresenter, "output is not PostListPresenter")

        let presenter: PostListPresenter = viewController.output as! PostListPresenter
        XCTAssertNotNil(presenter.view, "view in PostListPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PostListPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PostListRouter, "router is not PostListRouter")

        let interactor: PostListInteractor = presenter.interactor as! PostListInteractor
        XCTAssertNotNil(interactor.output, "output in PostListInteractor is nil after configuration")
    }

    class PostListViewControllerMock: PostListViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
