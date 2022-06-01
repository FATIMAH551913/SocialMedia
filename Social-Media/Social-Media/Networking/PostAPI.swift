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
    
   
    static func getAllPost(page: Int ,tag:String?, complitionHandler: @escaping ([Post], Int) -> ()){
        
       var url = baseURL + "/post"
        if var myTag = tag {
            myTag = myTag.trimmingCharacters(in: .whitespaces)
            url =  "\(baseURL)/tag/\(myTag)/post"
        }
        let params = [
            "page": "\(page)" , "limit" : "5"
        ]
        AF.request(url, parameters:params , encoder: URLEncodedFormParameterEncoder.default, headers: headers).responseJSON {  response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            let total = jsonData["total"].intValue
            //Decoding :
            let decoder = JSONDecoder()
            do {
               let posts = try decoder.decode([Post].self, from: data.rawData())
              complitionHandler(posts , total)
            }catch let error {
                print(error)
            }
            print(data)
        }
    }
    
    static func addNewPost(text:String, userId:String, complitionHandler: @escaping() -> ()){
      
        let url = "\(baseURL)/post/create"
        let params = [
             "text" : text,
             "owner" : userId
        ]
     
        AF.request(url, method: .post , parameters: params, encoder: JSONParameterEncoder.default , headers: headers).validate().responseJSON { response in
           
            switch response.result{
            case .success:
                 complitionHandler()
            case .failure(let error):
               print(error)
            }
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
    
    //MARK: TAG API
    
    static func getAllTags(complitionHandler: @escaping ([String]) -> ()){
       
        let url =  baseURL + "/tag"
        AF.request(url, headers: headers).responseJSON {  response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            //Decoding :
            let decoder = JSONDecoder()
            do {
               let tags = try decoder.decode([String].self, from: data.rawData())
              complitionHandler(tags)
            }catch let error {
                print(error)
            }
            print(data)
        }
    }

    
    //MARK: COMMENT API
    
    static func addNewCommentToPost(postId:String, userId:String, message: String, complitionHandler: @escaping() -> ()){
      
        let url = "\(baseURL)/comment/create"
        let params = [
             "post" : postId,
             "message" : message,
             "owner" : userId
        ]
     
        AF.request(url, method: .post , parameters: params, encoder: JSONParameterEncoder.default , headers: headers).validate().responseJSON { response in
           
            switch response.result{
            case .success:
                 complitionHandler()
            case .failure(let error):
               print(error)
            }
        }
    }
}

// static يعني ان الاستاتك لم يعد مرتبط بالاوبجكت من الكلاس بوست اي بي اي
