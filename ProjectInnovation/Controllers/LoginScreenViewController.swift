//
//  LoginScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 03/09/22.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailId: UITextField!
    
    @IBAction func signinBtnClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyTabBarViewController") as! MyTabBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
