//
//  ListPostsListPostsInitializer.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit

class ListPostsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var listpostsViewController: ListPostsViewController!

    override func awakeFromNib() {

        let configurator = ListPostsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listpostsViewController)
    }

}
