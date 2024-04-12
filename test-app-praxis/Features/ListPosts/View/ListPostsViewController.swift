//
//  ListPostsListPostsViewController.swift
//  test_app_praxis
//
//  Created by Pedro Alonso Daza B on 07/04/2024.
//  Copyright © 2024 MnC. All rights reserved.
//

import UIKit
import Toast

class ListPostsViewController: UIViewController {

    var output: ListPostsViewOutput!
    var userData: UserData?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var noDataImageView: UIImageView!
    
    var listPostData = [PostData]()
    var isLoadingData = false
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setData()
    }

    func setData() {
        tableView.register(ListPostsTableViewCell.nib(), forCellReuseIdentifier: ListPostsTableViewCell.identificador)
        loadData()
    }
    
    func loadData() {
        if let userData = LocalStorage().getUser() {
            nameLabel.text = userData.name
            emailLabel.text = userData.email
            output.getPostByUser(userId: String(userData.id ?? 0))
        }
    }
    
    @IBAction func addPostPressed(button: UIButton) {
        output.goToCreatePost()
    }
    // MARK: ListPostsViewInput
    
    
}
//MARK: -ListPostsViewInput

extension ListPostsViewController: ListPostsViewInput {
    
    func setupInitialState() {
    }
    
    func onGetListPost(listPostData: [PostData]){
        isLoadingData = false
        if listPostData.isEmpty {
            noDataImageView.isHidden = false
            return
        }
        noDataImageView.isHidden = true
        self.listPostData = listPostData
        tableView.reloadData()
    }
    
    func showError(error: String) {
        isLoadingData = false
        self.view.makeToast(error)
    }
    
}

//MARK: -ListPostsViewController

extension ListPostsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPostData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListPostsTableViewCell.identificador, for: indexPath) as? ListPostsTableViewCell {
            cell.setData(postData: listPostData[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}


//MARK: -

extension ListPostsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let tableViewContentSize = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height

        // Comprueba si el usuario ha llegado al final de la tabla
        if position > (tableViewContentSize - scrollViewHeight - 100) {
            // Evitar múltiples cargas
            if !isLoadingData {
                isLoadingData = true // Marca que estamos cargando datos

                // Cargar más datos
                loadData()
            }
        }
    }
}
