//
//  ListPostsListPostsPresenter.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

class ListPostsPresenter: ListPostsModuleInput, ListPostsViewOutput {

    weak var view: ListPostsViewInput!
    var interactor: ListPostsInteractorInput!
    var router: ListPostsRouterInput!
    var userData: UserData?
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
