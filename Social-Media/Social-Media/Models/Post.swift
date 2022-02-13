//
//  Model.swift
//  Social-Media
//
//  Created by MacBook on 08/07/1443 AH.
//

import Foundation
import UIKit



struct Post: Decodable {
    var id : String
    var image : String
    var likes : Int
    var text : String
    var owner : User
}

var posts:[Post] = []
