//
//  ListPostsListPostsInteractor.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

class ListPostsInteractor: ListPostsInteractorInput {

    weak var output: ListPostsInteractorOutput!
    var repository: PostRepository?
    init() {
        repository = PostRepository(postRepositoryDelegate: self)
    }

    func getPostByPost(userId: String){
        repository?.getListPostsByUser(userId: userId)
    }
}

//MARK: -ListPostsInteractor

extension ListPostsInteractor: PostRepositoryDelegate {
    func onSuccess(postData: PostData) {
        
    }
    
    func onSuccess(listPostData: [PostData]) {
        output.onSuccess(listPostData: listPostData)
    }
    
    func onError(error: String) {
        output.onError(error: error)
    }
    
    
}
