//
//  CreatePostsCreatePostsViewOutput.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

protocol CreatePostsViewOutput {

    /**
        @author Pedro Alonso Daza B
        Notify presenter that view is ready
    */
    func setUserData(userData: UserData)
    func viewIsReady()
    func onBack()
    func validateAndSendData(titleText: String, msgText: String)
}
