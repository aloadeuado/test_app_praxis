//
//  ListPostsListPostsViewInput.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

protocol ListPostsViewInput: class {

    /**
        @author Pedro Alonso Daza B
        Setup initial state of the view
    */

    func setupInitialState()
    func onGetListPost(listPostData: [PostData])
    func showError(error: String)
}
