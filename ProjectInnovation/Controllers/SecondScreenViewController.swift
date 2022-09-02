//
//  SecondScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import UIKit

class SecondScreenViewController: UIViewController {

    @IBOutlet weak var nameOfTaskField: UITextField!
    @IBOutlet weak var nameOfTask: UILabel!
    @IBOutlet weak var createNewTask: UILabel!
    @IBOutlet weak var addButton: UIButton!
    func setupUI() {
        self.nameOfTask.font = UIFont(name: "WorkSans-Regular", size: 20)
        self.createNewTask.font = UIFont(name: "WorkSans-Regular", size: 20)
        self.nameOfTaskField.layer.cornerRadius = 5
        let view1 = nameOfTask!
        view1.frame = CGRect(x: 0, y: 0, width: 132, height: 25)
        view1.backgroundColor = .white
        view1.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view1.font = UIFont(name: "WorkSans-Regular", size: 20)
        var view = nameOfTaskField
        view?.frame = CGRect(x: 0, y: 0, width: 366, height: 55)
        view?.backgroundColor = .white
        view?.layer.cornerRadius = 10
        view?.layer.borderWidth = 1
        view?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view?.translatesAutoresizingMaskIntoConstraints = false
        
        

        addButton.frame = CGRect(x: 0, y: 0, width: 320, height: 56)

        addButton.backgroundColor = .white


        addButton.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        addButton.layer.cornerRadius = 8


        
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
