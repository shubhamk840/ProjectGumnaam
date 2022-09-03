//
//  LoginScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 03/09/22.
//

import UIKit
var navBar:UINavigationController?
class LoginScreenViewController: UIViewController {


    @IBAction func slackButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TaskScreenViewController") as! TaskScreenViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func googleButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func microsoftButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondScreenViewController") as! SecondScreenViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        navBar = self.navigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
