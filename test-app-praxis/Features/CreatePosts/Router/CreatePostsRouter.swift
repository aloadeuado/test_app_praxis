//
//  CreatePostsCreatePostsRouter.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit

class CreatePostsRouter: CreatePostsRouterInput {
    var viewController: UIViewController!
    
    func onBack(){
        viewController.dismiss(animated: true)
    }
}
