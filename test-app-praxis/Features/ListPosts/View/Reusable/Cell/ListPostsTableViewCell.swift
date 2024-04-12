//
//  ListPostsTableViewCell.swift
//  test-app-praxis
//
//  Created by Pedro Alonso Daza B on 12/04/24.
//

import UIKit

class ListPostsTableViewCell: UITableViewCell {
    
    static let  identificador = "ListPostsTableViewCell"
    static func nib() -> UINib  {   return UINib(nibName: "ListPostsTableViewCell", bundle: Bundle(for: ListPostsTableViewCell.self))  }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var photoImageView: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(postData: PostData){
        if let user = LocalStorage().getUser() {
            photoImageView.loadAleatoryImage(userId: String(user.id ?? 0))
        }
        
        titleLabel.text = postData.title ?? ""
        messageLabel.text = postData.body ?? ""
    }
    
}
