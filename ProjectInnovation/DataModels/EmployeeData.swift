//
//  EmployeeData.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 03/09/22.
//

import Foundation

struct EmployeeData: Decodable {
    var username: String?
    var userid: String?
    var email: String?
    var fullname: String?
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case userid = "userid"
        case email = "email"
        case fullname = "fullname"
       
    }
}
