//
//  PostAPI.swift
//  Social-Media
//
//  Created by MacBook on 01/09/1443 AH.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostAPI:API {
    
   
    static func getAllPost(complitionHandler: @escaping ([Post]) -> ()){
       
        let url =  baseURL + "/post"
        AF.request(url, headers: headers).responseJSON {  response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            //Decoding :
            let decoder = JSONDecoder()
            do {
               let posts = try decoder.decode([Post].self, from: data.rawData())
              complitionHandler(posts)
            }catch let error {
                print(error)
            }
            print(data)
        }
    }
    
    static func getPostComment(id: String , complitionHandler: @escaping ([Comment]) -> () ){
        let url = "\(baseURL)/post/\(id)/comment" // اسمها سكيب للستنرنق
        AF.request(url, headers: headers).responseJSON { response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            //Decoding :
            let decoder = JSONDecoder()
            do {
                let comments = try decoder.decode([Comment].self, from: data.rawData())
                complitionHandler(comments)
            }catch let error {
                print(error)
            }
        }
        
    }
    
}
// static يعني ان الاستاتك لم يعد مرتبط بالاوبجكت من الكلاس بوست اي بي اي
