//
//  Comment.swift
//  Pods
//
//  Created by MacBook on 18/07/1443 AH.
//

import Foundation

struct Comment: Decodable {
    let id : String
    let message : String
    let owner : User

}
