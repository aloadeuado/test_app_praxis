//
//  CreatePostsCreatePostsInteractor.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

class CreatePostsInteractor: CreatePostsInteractorInput {

    weak var output: CreatePostsInteractorOutput!
    
    var repository: PostRepository?
    
    init() {
        repository = PostRepository(postRepositoryDelegate: self)
    }
    
    func postPost(userId: Int, titleText: String, msgText: String) {
        repository?.postPost(userId: userId, titleText: titleText, msgText: msgText)
    }
}


//MARK: -PostRepositoryDelegate

extension CreatePostsInteractor: PostRepositoryDelegate {
    func onSuccess(listPostData: [PostData]) {
        
    }
    
    func onSuccess(postData: PostData) {
        output.onSuccess(postData: postData)
    }
    
    func onError(error: String) {
        output.onError(error: error)
    }
}
