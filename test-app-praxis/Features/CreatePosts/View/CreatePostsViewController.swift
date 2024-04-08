//
//  CreatePostsCreatePostsViewController.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit

class CreatePostsViewController: UIViewController, CreatePostsViewInput {

    var output: CreatePostsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CreatePostsViewInput
    func setupInitialState() {
    }
}
