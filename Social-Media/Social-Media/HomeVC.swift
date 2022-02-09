//
//  HomeVC.swift
//  Social-Media
//
//  Created by MacBook on 07/07/1443 AH.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Post{
    
    
}
//var arrayPost = []

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let appId = "6202a19d8e6ae0624211e23b"
        let url = "https://dummyapi.io/data/v1/post"
        
        let headers: HTTPHeaders = [
            "app-id" : appId
        ]
        AF.request(url, headers: headers).responseJSON { response in
            print(response.value)
        }
        view.backgroundColor = .white
    }
    


}
