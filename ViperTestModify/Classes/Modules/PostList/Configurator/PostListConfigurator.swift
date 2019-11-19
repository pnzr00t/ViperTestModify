//
//  PostListPostListConfigurator.swift
//  ViperTestModify
//
//  Created by pnzr00t on 07/11/2019.
//  Copyright © 2019 OAP. All rights reserved.
//

import UIKit

class PostListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, serviceContainer: ServiceContainerProtocol?) {

        if let viewController = viewInput as? PostListViewController {
            configure(viewController: viewController, serviceContainer: serviceContainer)
        }
    }

    private func configure(viewController: PostListViewController, serviceContainer: ServiceContainerProtocol?) { // TODO: ServiceContainer -> service container protocol

        let router = PostListRouter()
        router.view = viewController // Crutch for dismiss

        let presenter = PostListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PostListInteractor(dataService: serviceContainer?.getPostInfoDataService())
        interactor.serviceContainer = serviceContainer // TODO: Refactor this ugly storage
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
 
