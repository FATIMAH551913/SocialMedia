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
}
