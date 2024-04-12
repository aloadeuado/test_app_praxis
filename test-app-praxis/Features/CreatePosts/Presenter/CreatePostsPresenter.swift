//
//  CreatePostsCreatePostsPresenter.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

class CreatePostsPresenter: CreatePostsModuleInput {

    weak var view: CreatePostsViewInput!
    var interactor: CreatePostsInteractorInput!
    var router: CreatePostsRouterInput!
    
    var userData: UserData?
    
    func viewIsReady() {

    }
    
    func setUserData(userData: UserData) {
        self.userData = userData
    }
}

//MARK: -CreatePostsPresenter

extension CreatePostsPresenter: CreatePostsViewOutput {
    
    func onBack() {
        router.onBack()
    }
    
    func validateAndSendData(titleText: String, msgText: String) {
        if(titleText.isEmpty || msgText.isEmpty){
            view.showError(error: "Por favor, llene todos los campos.")
            return
        }
        interactor.postPost(userId: userData?.id ?? 0, titleText: titleText, msgText: msgText)
    }
}


//MARK: -CreatePostsInteractorOutput
extension CreatePostsPresenter: CreatePostsInteractorOutput {
    func onSuccess(postData: PostData) {
        view.onGetPost(postData: postData)
    }
    
    func onError(error: String) {
        view.showError(error: error)
    }
    
    
}
