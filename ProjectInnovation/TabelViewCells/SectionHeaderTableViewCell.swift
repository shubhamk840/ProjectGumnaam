//
//  SectionHeaderTableViewCell.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var head: UILabel!
    @IBAction func clicked(_ sender: Any) {
        
    }
    @IBOutlet weak var clickedOnTheButton: UIButton!
    @IBOutlet weak var heading: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
