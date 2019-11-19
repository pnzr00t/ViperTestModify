//
//  AddPostAddPostConfiguratorTests.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import XCTest

class AddPostModuleConfiguratorTests: XCTestCase {

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
        let viewController = AddPostViewControllerMock()
        let configurator = AddPostModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AddPostViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AddPostPresenter, "output is not AddPostPresenter")

        let presenter: AddPostPresenter = viewController.output as! AddPostPresenter
        XCTAssertNotNil(presenter.view, "view in AddPostPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AddPostPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AddPostRouter, "router is not AddPostRouter")

        let interactor: AddPostInteractor = presenter.interactor as! AddPostInteractor
        XCTAssertNotNil(interactor.output, "output in AddPostInteractor is nil after configuration")
    }

    class AddPostViewControllerMock: AddPostViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
