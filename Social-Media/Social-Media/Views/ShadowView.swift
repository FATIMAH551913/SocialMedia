//
//  Shadow.swift
//  Social-Media
//
//  Created by MacBook on 23/07/1443 AH.
//

import UIKit

class ShadowView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUPShadow()
    }
 
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUPShadow()
    }
    
    func setUPShadow(){
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 10   //مقدار تجمع الظل
        self.layer.shadowOpacity = 0.7 //مقدار شفافية الظل من ١-الي ٠
        self.layer.cornerRadius = 7
        self.backgroundColor = .white
        
    }
    
}
