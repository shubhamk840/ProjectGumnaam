//
//  createTask.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import Foundation

struct CreateTask: Decodable {
    var message: String?
    var status: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
}
