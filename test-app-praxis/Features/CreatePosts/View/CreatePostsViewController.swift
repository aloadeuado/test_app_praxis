//
//  CreatePostsCreatePostsViewController.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit
import Toast

class CreatePostsViewController: UIViewController {

    var output: CreatePostsViewOutput!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var msgLabel: UITextView!

    var userData: UserData?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setData()
    }

    func setData(){
        if let userData = userData {
            output.setUserData(userData: userData)
        }
    }

    // MARK: CreatePostsViewInput
    func setupInitialState() {
    }
    
    @IBAction func onSendDataPressed(button: UIButton) {
        output.validateAndSendData(titleText: titleLabel.text ?? "", msgText: msgLabel.text
        ?? "")
    }
}

extension CreatePostsViewController: CreatePostsViewInput {
    func onGetPost(postData: PostData) {
        output.onBack()
    }
    
    func showError(error: String) {
        self.view.makeToast(error)
    }
}
