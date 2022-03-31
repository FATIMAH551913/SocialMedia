//
//  UIimage+StringUrlToImage.swift
//  Social-Media
//
//  Created by MacBook on 19/07/1443 AH.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImageFromStringUrl(stringUrl: String){

        if let url = URL(string: stringUrl) {
            if let imageData = try? Data(contentsOf: url){
               self.image = UIImage(data: imageData)
            }
            
        }
        
    }
    
    func makeCircularImage(){
        
                self.layer.cornerRadius = self.frame.width/2
        
    }
    
}

//extension  UILabel {
//
//    self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//    self.textAlignment = .left
//    self.textColor = .black
//
//}
