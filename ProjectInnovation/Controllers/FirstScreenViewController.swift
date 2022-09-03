//
//  FirstScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit

class FirstScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func setupCellLook(indexPath: IndexPath)->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardsTableViewCell", for: indexPath) as! CardsTableViewCell
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell", for: indexPath) as! SectionHeaderTableViewCell
            return cell
        }
        else if indexPath.row > 0 && indexPath.row <= 3 {
        let cell = setupCellLook(indexPath: indexPath)
       
        return cell
        }
        else if (indexPath.row == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell", for: indexPath) as! SectionHeaderTableViewCell
            return cell
        }
        else {
            let cell = setupCellLook(indexPath: indexPath)
            return cell
        }
    }
    
   
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        SVProgressHUD.show(currentViewController: self)
        let Services = Services()
        Services.createTask(endPoint: "get_task/",onSuccess: {
            (dogsData) in
            SVProgressHUD.dismiss(currentViewController: self)
            
        }, onFailure : {
            (error) in
            SVProgressHUD.dismiss(currentViewController: self)
            print(error)
        })
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
