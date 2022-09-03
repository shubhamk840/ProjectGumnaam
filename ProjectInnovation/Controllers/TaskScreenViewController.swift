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
        vc.navigationItem.title = "Assigned to me"
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func personalTaskBtnClicked(_ sender: Any) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size
            .width/2
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 0.892, green: 0.892, blue: 0.892, alpha: 1).cgColor
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
