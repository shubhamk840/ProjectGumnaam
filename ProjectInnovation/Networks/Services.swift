//
//  Services.swift
//  ProjectInnovation
//
//  Created by Shubham Kushwaha on 28/08/22.
//

import Foundation
import Alamofire

class Services {
    fileprivate var baseUrl = "https://peer-task-track.herokuapp.com/auth/"
    init(baseUrl: String = "https://peer-task-track.herokuapp.com/auth/") {
        self.baseUrl = baseUrl
    }
    
   
    func createTask(endPoint: String, parameters: Parameters?, onSuccess:(@escaping (Any)->()), onFailure:(@escaping (String)->())) {
        Alamofire.request(self.baseUrl + endPoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).response {
            (response) in
            guard let response = response.data else {
                onFailure("Something went wrong")
                return
            }
         
            print("Response have been recieved")
            do {
                let CreateTaskResponse = try JSONDecoder().decode(CreateTaskResponse.self, from: response)
                onSuccess(CreateTaskResponse)
            }
            catch {
                onFailure("err")
                print(error)
                print("Something wrong has occurred")
            }
        }
    }
    
    func fetchEmployeeList(endPoint: String,  onSuccess:(@escaping (Any)->()), onFailure:(@escaping (String)->())) {
        Alamofire.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            (response) in
            guard let response = response.data else {
                onFailure("Something went wrong")
                return
            }
            print("Response have been recieved")
            do {
                let EmployeeData = try JSONDecoder().decode([EmployeeData].self, from: response)
                onSuccess(EmployeeData)
                print(EmployeeData)
            }
            catch {
                onFailure("err")
                print(error)
                print("Something wrong has occurred")
            }
        }
    }
    
    func fetchData(endPoint: String,  onSuccess:(@escaping (Any)->()), onFailure:(@escaping (String)->())) {
        Alamofire.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            (response) in
            guard let response = response.data else {
                onFailure("Something went wrong")
                return
            }
            print("Response have been recieved")
            do {
                let CreateTask = try JSONDecoder().decode([CreateTask].self, from: response)
                onSuccess(CreateTask)
                print(CreateTask)
            }
            catch {
                onFailure("err")
                print(error)
                print("Something wrong has occurred")
            }
        }
    }
}
