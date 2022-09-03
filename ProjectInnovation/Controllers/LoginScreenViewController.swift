//
//  LoginScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 03/09/22.
//

import UIKit
var navBar:UINavigationController?
class LoginScreenViewController: UIViewController {

    @IBOutlet weak var slackView: UIView!
    @IBOutlet weak var googleView: UIView!
    @IBOutlet weak var microsoftView: UIView!
    
    @IBAction func slackButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyTabBarViewController") as! MyTabBarViewController
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func googleButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyTabBarViewController") as! MyTabBarViewController
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func microsoftButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "IndividualTaskViewController") as! IndividualTaskViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        navBar = self.navigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.microsoftView.layer.cornerRadius = 8
        self.slackView.layer.cornerRadius = 8
        self.googleView.layer.cornerRadius = 8
    }


}
