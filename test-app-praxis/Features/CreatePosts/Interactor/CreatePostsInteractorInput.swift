//
//  CreatePostsCreatePostsInteractorInput.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import Foundation

protocol CreatePostsInteractorInput {
    
    func postPost(userId: Int, titleText: String, msgText: String)
}
