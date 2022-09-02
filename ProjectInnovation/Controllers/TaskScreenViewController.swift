//
//  TaskScreenViewController.swift
//  ProjectInnovation
//
//  Created by Sanskar Gautam on 03/09/22.
//

import UIKit

class TaskScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
        self.tableView.separatorStyle = .none
    }
}
