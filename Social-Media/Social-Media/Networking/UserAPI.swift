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
                let emailError = data["email"].stringValue
                complitionHandler(nil, emailError)
               
            }
            
        }
    }
}
