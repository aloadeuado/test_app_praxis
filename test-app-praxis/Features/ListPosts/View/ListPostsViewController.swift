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
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setData()
    }

    func setData() {
        tableView.register(ListPostsTableViewCell.nib(), forCellReuseIdentifier: ListPostsTableViewCell.identificador)
        if let userData = LocalStorage().getUser() {
            nameLabel.text = userData.name
            emailLabel.text = userData.email
            output.getPostByUser(userId: String(userData.id ?? 0))
        }
    }
    
    @IBAction func addPostPressed(button: UIButton) {
        
    }
    // MARK: ListPostsViewInput
    
    
}
//MARK: -ListPostsViewInput

extension ListPostsViewController: ListPostsViewInput {
    
    func setupInitialState() {
    }
    
    func onGetListPost(listPostData: [PostData]){
        if listPostData.isEmpty {
            noDataImageView.isHidden = false
            return
        }
        noDataImageView.isHidden = true
        self.listPostData = listPostData
        tableView.reloadData()
    }
    
    func showError(error: String) {
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
}
