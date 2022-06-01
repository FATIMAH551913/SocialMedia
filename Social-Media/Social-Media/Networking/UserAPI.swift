//
//  UserAPI.swift
//  Social-Media
//
//  Created by MacBook on 01/09/1443 AH.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserAPI:API {
  
    static func getUserData(id:String, complitionHandler: @escaping(User) -> ()){
      
        let url = "\(baseURL)/user/\(id)"
     
        AF.request(url, headers: headers).responseJSON { response in
            let jsonData = JSON(response.value)
            let decoder = JSONDecoder()
            do {
               let user = try decoder.decode(User.self, from: jsonData.rawData())
             complitionHandler(user)
            }catch let error {
                print(error)
            }
        }
    }
    
    static func RegesterNewUser(firstName: String, lastName:String, email:String, complitionHandler: @escaping(User?, String?) -> ()){
      
        let url = "\(baseURL)/user/create"
        let params = [
             "firstName" : firstName,
             "lastName" : lastName,
             "email" : email
        ]
     
        AF.request(url, method: .post , parameters: params, encoder: JSONParameterEncoder.default , headers: headers).validate().responseJSON { response in
           
            switch response.result{
                
                
            case .success:
                let jsonData = JSON(response.value)
                print(jsonData)
                let decoder = JSONDecoder()
                do {
                   let user = try decoder.decode(User.self, from: jsonData.rawData())
                 complitionHandler(user, nil)
                }catch let error {
                    print(error)
                }
            case .failure(let error):
                let jsonData = JSON(response.data)
                let data = jsonData["data"]
                
                //error messages
                let emailError = data["email"].stringValue
                let firstNameError = data["firstName"].stringValue
                let lastNameError = data["lastName"].stringValue
                let messageErorr = firstNameError + " " + lastNameError + " " + emailError
                complitionHandler(nil, messageErorr)
               
            }
            
        }
    }
    
    static func SignInUser(firstName: String, lastName:String, complitionHandler: @escaping(User?, String?) -> ()){
      
        let url = "\(baseURL)/user"
        let params = [
            "created" : "1"
        ]
     
        AF.request(url, method: .get , parameters: params, encoder: URLEncodedFormParameterEncoder.default , headers: headers).validate().responseJSON { response in
           
            switch response.result{
                
            case .success:
                let jsonData = JSON(response.value)
                let data = jsonData["data"]
                print(jsonData)
                let decoder = JSONDecoder()
                do {
                   let users = try decoder.decode([User].self, from: data.rawData())
                 
                    var foundUser:User?
                    
                    for user in users {
                        if user.firstName == firstName && user.lastName == lastName {
                            foundUser = user
                            break
                        }
                        
                    }
                    
                    if let user = foundUser {
                        complitionHandler(user, nil)
                    }else{
                        complitionHandler(nil , "The firstname or the lasteName don't match any user ")
                    }
//                 complitionHandler(user, nil)
                    
                    
                }catch let error {
                    print(error)
                   
                }
            case .failure(let error):
                let jsonData = JSON(response.data)
                let data = jsonData["data"]
               
                let firstNameError = data["firstName"].stringValue
                let lastNameError = data["lastName"].stringValue
                let messageErorr = firstNameError + " " + lastNameError
                complitionHandler(nil, messageErorr)
               
            }
            
        }
    }
    
    static func updateUserInfo(userId: String,firstName: String, phone:String, imageUrl: String ,complitionHandler: @escaping(User?, String?) -> ()){
      
        let url = "\(baseURL)/user/\(userId)"
        let params = [
            "firstName" : firstName,
            "phone" : phone ,
            "picture" : imageUrl
        ]
     
        AF.request(url, method: .put , parameters: params, encoder: JSONParameterEncoder.default , headers: headers).validate().responseJSON { response in
           
            switch response.result{
                
            case .success:
                let jsonData = JSON(response.value)
                print(jsonData)
                let decoder = JSONDecoder()
                do {
                   let user = try decoder.decode(User.self, from: jsonData.rawData())
                 
                   
                 complitionHandler(user, nil)
                    
                    
                }catch let error {
                    print(error)
                   
                }
            case .failure(let error):
                let jsonData = JSON(response.data)
                let data = jsonData["data"]
               
                let firstNameError = data["firstName"].stringValue
                let lastNameError = data["lastName"].stringValue
                let messageErorr = firstNameError + " " + lastNameError
                complitionHandler(nil, messageErorr)
               
            }
            
        }
    }
}

