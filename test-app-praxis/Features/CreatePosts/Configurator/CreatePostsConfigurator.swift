//
//  CreatePostsCreatePostsConfigurator.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit

class CreatePostsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CreatePostsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CreatePostsViewController) {

        let router = CreatePostsRouter()

        let presenter = CreatePostsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreatePostsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
