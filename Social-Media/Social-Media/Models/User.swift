//
//  User.swift
//  Social-Media
//
//  Created by MacBook on 10/07/1443 AH.
//

import Foundation

struct User: Decodable {
   
    var id: String
    var firstName: String
    var lastName: String
    var picture: String
    var gender: String?
    var phone: String?
    var email:String?
    var location:Location?
    
    
}
