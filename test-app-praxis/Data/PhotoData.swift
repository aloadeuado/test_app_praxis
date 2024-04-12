//
//  PhotoData.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 8/04/24.
//

import Foundation
// MARK: - PhotoData
struct PhotoData: Codable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
