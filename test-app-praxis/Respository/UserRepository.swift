//
//  UserRepository.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 7/04/24.
//

import Foundation
protocol UserRepositoryDelegate {
    func onSuccess(userData: UserData)
    func onError(error: String)
}
class UserRepository {
    var userRepositoryDelegate: UserRepositoryDelegate?
    
    init(userRepositoryDelegate: UserRepositoryDelegate) {
        self.userRepositoryDelegate = userRepositoryDelegate
    }
    // eso solo emula la etapa de traer un usuario predeterminado
    func getUser(email: String) {
        ApiServices().requestHttpwithUrl(EpUrl: getListUsers(), method: .get, withData: ["":""], modelType: [UserData].self) {[weak self] success, listUsers, error in
            if(success) {
                if let listUsers = listUsers, let user = listUsers.randomElement(){
                    LocalStorage.sharred.saveUser(userData: user)
                    self?.userRepositoryDelegate?.onSuccess(userData: user)
                    return
                }
            }
            self?.userRepositoryDelegate?.onError(error: error?.localizedDescription ?? "")
        }
    }
}
