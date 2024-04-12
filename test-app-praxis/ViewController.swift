//
//  ViewController.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 7/04/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController {

    var userRepository: UserRepository?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        userRepository = UserRepository(userRepositoryDelegate: self)

        // Start the sign in flow!
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else {return}
            if let user = user {
                // El usuario está autenticado, `user` es un objeto `User` no `nil`
                if let userData = LocalStorage.sharred.getUser() {
                    show(controller: self, userData: userData)
                    return
                }
                self.userRepository?.getUser(email: user.email ?? "")
            } else {
                // No hay usuario autenticado
                print("No hay usuario autenticado.")
            }
        }
    }
    @IBAction func authPressed(button: UIButton) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard error == nil else {
                // ...
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                // ...
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { [weak self] result, error in
                
                let firebaseAuth = Auth.auth()
                self?.userRepository?.getUser(email: firebaseAuth.currentUser?.email ?? "")
                
            }
        }
        
    }

}

//MARK: -UserRepositoryDelegate

extension ViewController: UserRepositoryDelegate {
    func onSuccess(userData: UserData) {
        show(controller: self, userData: userData)
    }
    
    func onError(error: String) {
        
    }
    
    
}

//MARK: -presents

extension ViewController {
    func show(controller: UIViewController, userData: UserData) {
        let listPostsViewController = ListPostsViewController(nibName: "ListPostsViewController", bundle: nil)
        listPostsViewController.userData = userData
        listPostsViewController.modalPresentationStyle = .overFullScreen
        controller.present(listPostsViewController, animated: true)
    }
}
