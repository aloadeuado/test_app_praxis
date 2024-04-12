//
//  UIImageView+Extension.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 8/04/24.
//

import Foundation
import UIKit
import SDWebImage

class CustomImageView: UIImageView {
    var photosRepository: PhotosRepository?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        photosRepository = PhotosRepository(photosRepositoryDelegate: self)
    }
    
    func loadAleatoryImage(userId: String) {
        photosRepository?.getAleatoryPhotosByUser(userId: userId)
    }
}

//MARK: -PhotosRepositoryDelegate
extension CustomImageView: PhotosRepositoryDelegate {
    func onSuccess(photoData: PhotoData) {
        if let url = URL(string: photoData.url ?? "") {
            self.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolderImage"))
        }
        
    }
    
    func onError(error: String) {
        //No Data
    }
    
    
}
