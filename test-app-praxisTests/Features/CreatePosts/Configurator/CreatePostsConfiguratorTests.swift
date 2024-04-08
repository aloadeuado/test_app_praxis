//
//  CreatePostsCreatePostsConfiguratorTests.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import XCTest

class CreatePostsModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = CreatePostsViewControllerMock()
        let configurator = CreatePostsModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CreatePostsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CreatePostsPresenter, "output is not CreatePostsPresenter")

        let presenter: CreatePostsPresenter = viewController.output as! CreatePostsPresenter
        XCTAssertNotNil(presenter.view, "view in CreatePostsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CreatePostsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CreatePostsRouter, "router is not CreatePostsRouter")

        let interactor: CreatePostsInteractor = presenter.interactor as! CreatePostsInteractor
        XCTAssertNotNil(interactor.output, "output in CreatePostsInteractor is nil after configuration")
    }

    class CreatePostsViewControllerMock: CreatePostsViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
