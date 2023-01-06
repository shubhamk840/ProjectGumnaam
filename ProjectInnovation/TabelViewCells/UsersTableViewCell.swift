//
//  UsersTableViewCell.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 03/09/22.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
}
