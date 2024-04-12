//
//  ListPostsListPostsPresenter.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

class ListPostsPresenter: ListPostsModuleInput {

    weak var view: ListPostsViewInput!
    var interactor: ListPostsInteractorInput!
    var router: ListPostsRouterInput!

    func viewIsReady() {

    }
    
    func getPostByUser(userId: String) {
        interactor.getPostByPost(userId: userId)
    }
}


//MARK: -ListPostsInteractorOutput

extension ListPostsPresenter: ListPostsInteractorOutput {
    func onSuccess(listPostData: [PostData]) {
        view.onGetListPost(listPostData: listPostData)
    }
    
    func onError(error: String) {
        view.showError(error: error)
    }
}


//MARK: -ListPostsViewOutput

extension ListPostsPresenter: ListPostsViewOutput {
    
    func goToCreatePost() {
        if let userData = LocalStorage.sharred.getUser() {
            router.goToCreatePost(userData: userData)
        }
    }
}
