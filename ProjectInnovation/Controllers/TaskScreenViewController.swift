//
//  TaskScreenViewController.swift
//  ProjectInnovation
//
//  Created by Sanskar Gautam on 03/09/22.
//

import UIKit

class TaskScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var peopleTitle: UILabel!
    @IBAction func fourthCardBtnClicked(_ sender: Any) {
    }
    @IBOutlet weak var fourthBtnClicked: UIButton!
    
    @IBOutlet weak var assignedToYouBtnClicked: UIButton!
    
    @IBAction func byMeBtnClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AssignedMeTaskViewController") as! AssignedMeTaskViewController
        vc.navigationItem.title = "Assigned by me"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func toYouBtnClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AssignedMeTaskViewController") as! AssignedMeTaskViewController
        vc.navigationItem.title = "Assigned to you"
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func personalTaskBtnClicked(_ sender: Any) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size
            .width/2
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    func setupUI(){

        self.peopleTitle.frame = CGRect(x: 0, y: 0, width: 84, height: 26)
        self.peopleTitle.backgroundColor = .white
        self.peopleTitle.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.peopleTitle.font = UIFont(name: "Montserrat-Bold", size: 20)
        
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
        self.navigationItem.title = "All Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
        self.tableView.separatorStyle = .none
    }
   
}
