//
//  AddPostAddPostConfigurator.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import UIKit

class AddPostModuleConfigurator {
    private var postInfo: PostInfo? = nil // Post info for editing
    
    init(postInfo: PostInfo? = nil) {
        self.postInfo = postInfo
    }
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, serviceContainer: ServiceContainerProtocol?) {

        if let viewController = viewInput as? AddPostViewController {
            configure(viewController: viewController, serviceContainer: serviceContainer)
        }
    }

    private func configure(viewController: AddPostViewController, serviceContainer: ServiceContainerProtocol?) {

        let router = AddPostRouter()
        router.view = viewController // Crutch for dismiss

        let presenter = AddPostPresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.initPostInfoForModify(postInfo: self.postInfo)

        let interactor = AddPostInteractor()
        interactor.output = presenter
        interactor.serviceContainer = serviceContainer
        interactor.initDataService(dataService: serviceContainer?.getAddPostDataService())

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
