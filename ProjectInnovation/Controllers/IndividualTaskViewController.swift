//
//  IndividualTaskViewController.swift
//  ProjectInnovation
//
//  Created by Sanskar Gautam on 03/09/22.
//

import UIKit
import DropDown

class IndividualTaskViewController: UIViewController {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var priorityButton: UIButton!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var commentTexFeild: UITextView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var priorityView: UIView!
    
    let dropDownForPriority = DropDown()
    let dropDownForStatus = DropDown()
    let priorityArray = ["High", "Medium", "Low"]
    let statusArray = ["To do", "In Progress", "Done"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commentView.layer.backgroundColor = UIColor(red: 0.835, green: 0.8, blue: 1, alpha: 1).cgColor
        self.commentView.layer.cornerRadius = 8
        self.commentTexFeild.layer.cornerRadius = 8
        self.priorityButton.layer.cornerRadius = 8
        self.statusButton.layer.cornerRadius = 8
        self.date.layer.masksToBounds = true
        self.date.layer.cornerRadius = 8
        dropDownForStatus.anchorView = statusView
        dropDownForPriority.anchorView = priorityView
        dropDownForStatus.dataSource = statusArray
        dropDownForPriority.dataSource = priorityArray
        priorityButton.addTarget(self, action: #selector(showPriority), for: .touchDown)
        statusButton.addTarget(self, action: #selector(showStatus), for: .touchDown)
        dropDownForPriority.selectionAction = { [unowned self] (index: Int, item: String) in
            priorityButton.setTitle(item, for: .normal)
        }
        dropDownForStatus.selectionAction = { [unowned self] (index: Int, item: String) in
            statusButton.setTitle(item, for: .normal)
        }
        priorityView.isHidden = true
        statusView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @objc func showPriority(sender: Any) {
        dropDownForPriority.show()
    }
    
    @objc func showStatus(sender: Any) {
        dropDownForStatus.show()
    }
    
}
