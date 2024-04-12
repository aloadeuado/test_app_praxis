//
//  ListPostsListPostsConfigurator.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit

class ListPostsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListPostsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListPostsViewController) {

        let router = ListPostsRouter()
        router.viewController = viewController
        
        let presenter = ListPostsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListPostsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
