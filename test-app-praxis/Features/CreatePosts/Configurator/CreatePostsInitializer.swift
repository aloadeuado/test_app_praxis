//
//  CreatePostsCreatePostsInitializer.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit

class CreatePostsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var createpostsViewController: CreatePostsViewController!

    override func awakeFromNib() {

        let configurator = CreatePostsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: createpostsViewController)
    }

}
