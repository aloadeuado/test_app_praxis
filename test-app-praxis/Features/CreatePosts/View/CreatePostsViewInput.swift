//
//  CreatePostsCreatePostsViewInput.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

protocol CreatePostsViewInput: class {

    /**
        @author Pedro Alonso Daza B
        Setup initial state of the view
    */
    func onGetPost(postData: PostData)
    func showError(error: String)
    func setupInitialState()
}
