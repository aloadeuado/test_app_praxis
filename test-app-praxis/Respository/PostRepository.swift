//
//  PostRepository.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 8/04/24.
//

import Foundation

protocol PostRepositoryDelegate {
    func onSuccess(listPostData: [PostData])
    func onSuccess(postData: PostData)
    func onError(error: String)
}

class PostRepository {
    var postRepositoryDelegate: PostRepositoryDelegate?
    
    init(postRepositoryDelegate: PostRepositoryDelegate) {
        self.postRepositoryDelegate = postRepositoryDelegate
    }
    
    func getListPostsByUser(userId: String) {
        let url = getListPostsByUsers(userId: userId)
        
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["" : ""], modelType: [PostData].self) { [weak self] success, listPostData, error in
            if(success) {
                if let listPostData = listPostData {
                    self?.postRepositoryDelegate?.onSuccess(listPostData: listPostData)
                    return
                }
            }
            self?.postRepositoryDelegate?.onError(error: error?.localizedDescription ?? "An unknown error occurred")
        }
    }
    
    func postPost(userId: Int, titleText: String, msgText: String) {
        let url = postAddPosts()
        
        let params = ["userId": userId, "title": titleText, "body":msgText] as [String : Any]
        
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .post, withData: params, modelType: PostData.self) { [weak self] success, postData, error in
            if(success) {
                if let postData = postData {
                    self?.postRepositoryDelegate?.onSuccess(postData: postData)
                    return
                }
            }
            self?.postRepositoryDelegate?.onError(error: error?.localizedDescription ?? "An unknown error occurred")
        }
    }
}
