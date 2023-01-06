//
//  createTask.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 02/09/22.
//

import Foundation

struct CreateTask: Decodable {
    var priority: String?
    var assignee: String?
    var taskTitle: String?
    var description: String?
    var dueDate: String?
    var taskCreater: String?
    
    enum CodingKeys: String, CodingKey {
        case priority = "message"
        case assignee = "assignee"
        case taskTitle = "taskTitle"
        case dueDate = "dueDate"
        case description = "description"
        case taskCreater = "taskCreaterString"
    }
}
