//
//  ListPostsListPostsConfiguratorTests.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import XCTest

class ListPostsModuleConfiguratorTests: XCTestCase {

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
        let viewController = ListPostsViewControllerMock()
        let configurator = ListPostsModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ListPostsViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ListPostsPresenter, "output is not ListPostsPresenter")

        let presenter: ListPostsPresenter = viewController.output as! ListPostsPresenter
        XCTAssertNotNil(presenter.view, "view in ListPostsPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ListPostsPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ListPostsRouter, "router is not ListPostsRouter")

        let interactor: ListPostsInteractor = presenter.interactor as! ListPostsInteractor
        XCTAssertNotNil(interactor.output, "output in ListPostsInteractor is nil after configuration")
    }

    class ListPostsViewControllerMock: ListPostsViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
