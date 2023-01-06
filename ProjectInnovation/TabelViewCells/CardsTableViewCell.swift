//
//  CardsTableViewCell.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit

class CardsTableViewCell: UITableViewCell {

    @IBOutlet weak var viewInsideCell: UIView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var privateNotes: UILabel!
    @IBOutlet weak var subtask: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var priority: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var daysLeft: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = true
        var paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineHeightMultiple = 0.83
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
}
