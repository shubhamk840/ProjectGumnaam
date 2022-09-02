//
//  ViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 28/08/22.
//

import UIKit

class ThirdScreenViewController: UIViewController {

    @IBOutlet weak var clickMe: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AssignedMeTaskViewController") as! AssignedMeTaskViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

