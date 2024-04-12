//
//  ListPostsListPostsRouter.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//
import UIKit

class ListPostsRouter: ListPostsRouterInput {
    var viewController: UIViewController!
    func goToCreatePost(userData: UserData) {
        let createPostsViewController = CreatePostsViewController(nibName: "CreatePostsViewController", bundle: nil)
        createPostsViewController.userData = userData
        
        viewController.present(createPostsViewController, animated: true)
        
        
    }
}
