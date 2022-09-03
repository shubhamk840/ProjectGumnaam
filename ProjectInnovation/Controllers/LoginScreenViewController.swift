//
//  LoginScreenViewController.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 03/09/22.
//

import UIKit
var userIdOfTheUser:EmployeeData?
var allUserData = [CreateTask]()
var employeeData = [EmployeeData]()
class LoginScreenViewController: UIViewController {

    func makeAnApiCall() {
        SVProgressHUD.show(currentViewController: self)
        let Services = Services()
        Services.fetchEmployeeList(endPoint: "get_emp_list/",onSuccess: {
            (response) in
            employeeData = response as! [EmployeeData]
            print(employeeData)
            print(employeeData.count)
            SVProgressHUD.dismiss(currentViewController: self)
            
        }, onFailure : {
            (error) in
            SVProgressHUD.dismiss(currentViewController: self)
            print(error)
        })
        
        SVProgressHUD.show(currentViewController: self)
        Services.fetchData(endPoint: "get_task/",onSuccess: {
            (response) in
            allUserData = response as! [CreateTask]
            print(allUserData)
            print(allUserData.count)
            SVProgressHUD.dismiss(currentViewController: self)
            
        }, onFailure : {
            (error) in
            SVProgressHUD.dismiss(currentViewController: self)
            print(error)
        })
    }
    @IBAction func slackButton(_ sender: Any) {
        makeAnApiCall()
        userIdOfTheUser = EmployeeData(username: "Shubhransh Gupta", userid: "U02288VLLGY", email: "shubhransh.gupta@gonuclei.com", fullname: "Shubhransh Gupta")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyTabBarViewController") as! MyTabBarViewController
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func googleButton(_ sender: Any) {
        makeAnApiCall()
        userIdOfTheUser = EmployeeData(username: "sumit.sarkar", userid: "U02H625MLSV", email: "sumit.sarkar@gonuclei.com", fullname: "Sumit Sarkar")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyTabBarViewController") as! MyTabBarViewController
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func microsoftButton(_ sender: Any) {
        makeAnApiCall()
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyTabBarViewController") as! MyTabBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
