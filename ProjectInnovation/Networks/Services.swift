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
    
    func getAllCountriesName(endPoint: String,  onSuccess:(@escaping (DogsData)->()), onFailure:(@escaping (String)->())) {
        Alamofire.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response {
            (response) in
            guard let response = response.data else {
                onFailure("Something went wrong")
                return
            }
            print("Response have been recieved")
            do {
            print(response)
            let dogsData = try JSONDecoder().decode(DogsData.self, from: response)
                onSuccess(dogsData)
                print(dogsData)
            }
            catch {
                onFailure("Something Went Wrong")
                print("Something wrong has occurred")
            }
        }
    }
    func createTask(endPoint: String,  onSuccess:(@escaping (Any)->()), onFailure:(@escaping (String)->())) {
        let parameters = ["title": "Hi bro","description":"task1 for heroku"]
        Alamofire.request(self.baseUrl + endPoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).response {
            (response) in
            guard let response = response.data else {
                onFailure("Something went wrong")
                return
            }
         
            print("Response have been recieved")
            do {
                let dogsData = try JSONDecoder().decode([DogsData].self, from: response)
                onSuccess(dogsData)
                print(dogsData)
            }
            catch {
                onFailure("err")
                print(error)
                print("Something wrong has occurred")
            }
        }
    }
}
