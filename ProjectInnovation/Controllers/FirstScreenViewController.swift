//
//  FirstScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit

class FirstScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func setupCellLook(indexPath: IndexPath, data:[CreateTask])->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
        cell.selectionStyle = .none
        cell.priority.layer.backgroundColor = UIColor(red: 1, green: 0.9, blue: 0.9, alpha: 1).cgColor
        cell.priority.layer.cornerRadius = 8
        cell.status.layer.backgroundColor = UIColor(red: 0.858, green: 0.89, blue: 1, alpha: 1).cgColor
        cell.status.layer.cornerRadius = 8
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size
            .width/2
        cell.viewInsideCell.backgroundColor = .white
        cell.viewInsideCell.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        cell.viewInsideCell.layer.cornerRadius = 8
        cell.viewInsideCell.layer.borderWidth = 1
        cell.viewInsideCell.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        if indexPath.row < allUserData.count {
            cell.mainTitle.text = allUserData[indexPath.row].taskTitle
            cell.priority.text = allUserData[indexPath.row].priority ?? "High"
            cell.dueDate.text = "Due Date" + (allUserData[indexPath.row].dueDate! ?? "2-JULY-2022")
        }
        return cell
    }
    var totalNumberOfRow = 8
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        totalNumberOfRow
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 4 {
            return CGFloat(30)
        }
        return CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.row == 0 || indexPath.row == 4 {
            let vc = storyboard.instantiateViewController(withIdentifier: "AssignedMeTaskViewController") as! AssignedMeTaskViewController
//            vc.navigationItem.title = self.head.text
            vc.title = "Assigned Tasks"
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        let vc = storyboard.instantiateViewController(withIdentifier: "IndividualTaskViewController") as! IndividualTaskViewController
        if indexPath.row < allUserData.count {
            vc.desc = allUserData[indexPath.row].description ?? "This is description about the task"
            vc.title = allUserData[indexPath.row].taskTitle ?? "This is the task"
        }
        else {
            vc.desc = "This is description about the task"
            vc.titleForTask = "PR Review"
            vc.title = "PR Review"
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell", for: indexPath) as! SectionHeaderTableViewCell
            cell.head.text = "Assigned to me"
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row > 0 && indexPath.row <= 3 {
            let cell = setupCellLook(indexPath: indexPath, data: assigneToMe)
       
        return cell
        }
        else if (indexPath.row == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell", for: indexPath) as! SectionHeaderTableViewCell
            cell.head.text = "Assigned by me"
            return cell
        }
        else {
            let cell = setupCellLook(indexPath: indexPath,data: assignByMe)
            return cell
        }
    }
    
   
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        self.navigationItem.title = "Overview"
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CardsTableViewCell", bundle: nil), forCellReuseIdentifier: "CardsTableViewCell")
        self.tableView.register(UINib(nibName: "SectionHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionHeaderTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    

}
