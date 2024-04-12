//
//  LocalStorage.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 8/04/24.
//

import Foundation
class LocalStorage {
    static var sharred = LocalStorage()
    let defaults = UserDefaults.standard
    
    func saveUser(userData: UserData) {
        if let decode = try? JSONEncoder().encode(userData) {
            defaults.set(decode, forKey: "kUserData")
        }
    }
    
    func getUser() -> UserData? {
        if let data = defaults.object(forKey: "kUserData") as? Data {
            if let userData = try? JSONDecoder().decode(UserData.self, from: data) {
                // Ahora `loadedObject` es una instancia de `MiClaseCustom`
                return userData
            }
        }
        return nil
    }
}
