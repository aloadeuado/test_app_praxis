//
//  CreatePostsCreatePostsPresenter.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

class CreatePostsPresenter: CreatePostsModuleInput, CreatePostsViewOutput, CreatePostsInteractorOutput {

    weak var view: CreatePostsViewInput!
    var interactor: CreatePostsInteractorInput!
    var router: CreatePostsRouterInput!

    func viewIsReady() {

    }
}
