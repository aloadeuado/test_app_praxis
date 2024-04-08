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
func getListRecipesUrl() -> String {
    return getStringOfInfo(key: "URL_LIST_RECIPES")
}

func getDetailRecipesUrl() -> String {
    return getStringOfInfo(key: "URL_DETAIL_RECIPES")
}

func getUrlApod() -> String {
    return "https://api.nasa.gov/planetary/apod" + "?api_key=" + "m9loOd79vKI0ArBwtmhX2gOGRQbIMi7vNttpIzaR&date={date}"
}
