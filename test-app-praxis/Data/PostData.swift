//
//  PostData.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 8/04/24.
//

import Foundation
// MARK: - PostData
struct PostData: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
