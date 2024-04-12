//
//  PhotosRepository.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 8/04/24.
//

import Foundation
protocol PhotosRepositoryDelegate {
    func onSuccess(photoData:PhotoData)
    func onError(error: String)
}
class PhotosRepository {
    var photosRepositoryDelegate:PhotosRepositoryDelegate?
    init(photosRepositoryDelegate: PhotosRepositoryDelegate) {
        self.photosRepositoryDelegate = photosRepositoryDelegate
    }
    
    func getAleatoryPhotosByUser(userId: String) {
        let url = getListPhotosByUsers(userId: userId)
        
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["" : ""], modelType: [PhotoData].self) {[weak self] success, listPhotos, error in
            if(success) {
                if let listPhotos = listPhotos, let photoData = listPhotos.randomElement(){
                    debugPrint("Datos complejos: " + (photoData.url ?? ""))
                    debugPrint("Datos complejos photosRepositoryDelegate: " + (self?.photosRepositoryDelegate.debugDescription ?? ""))
                    self?.photosRepositoryDelegate?.onSuccess(photoData: photoData)
                    return
                }
            }
            self?.photosRepositoryDelegate?.onError(error: error?.localizedDescription ?? "")
        }
    }
}
