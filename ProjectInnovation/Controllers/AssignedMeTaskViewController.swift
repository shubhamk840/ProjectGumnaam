//
//  AssignedMeTaskViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit
import DropDown

class AssignedMeTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = setupCellLook(indexPath: indexPath)
        return cell
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        rightBarDropDown.selectionAction = { (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)") }
        
        rightBarDropDown.width = 140
        rightBarDropDown.bottomOffset = CGPoint(x: 0, y:(searchController.searchBar.plainView.bounds.height))
        rightBarDropDown.show()
    }
    
    func setupDropDown() {
        rightBarDropDown.dataSource = ["By date", "By priority"]
        rightBarDropDown.cellConfiguration = {
            (index, item) in
            return "\(item)"
        }
    }
    
    let searchController = UISearchController()
    let rightBarDropDown = DropDown()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(named: "Sort"), for: .bookmark, state: .normal)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CardsTableViewCell", bundle: nil), forCellReuseIdentifier: "CardsTableViewCell")
        setupDropDown()
        self.tableView.separatorStyle = .none
    }
    
    
}
