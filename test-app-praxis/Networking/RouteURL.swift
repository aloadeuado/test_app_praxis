//
//  RouteURL.swift
//  test_exalt
//
//  Created by iMac on 9/02/23.
//

import Foundation

func getStringOfInfo(key:String) -> String{
    
    if let value = Bundle.main.object(forInfoDictionaryKey: key) {
        if let stringValue = value as? String {
            return stringValue
        }
    }
    
    return ""
     
}

func getListUsers() -> String {
    return getStringOfInfo(key: "BASE_UREL") + "/users"
}

func getListPhotosByUsers(userId: String) -> String {
    return getStringOfInfo(key: "BASE_UREL") + "/photos?albumId=" + userId
}

func getListPostsByUsers(userId: String) -> String {
    return getStringOfInfo(key: "BASE_UREL") + "/posts?userId=" + userId
}
