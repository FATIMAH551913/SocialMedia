//
//  PostTagCell.swift
//  Social-Media
//
//  Created by MacBook on 27/10/1443 AH.
//

import UIKit

class PostTagCell: UICollectionViewCell {
    
    
    
//    let backView = ShadowView()
    let tagNameLbl: UILabel = {
           $0.textColor =  UIColor.label
           $0.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .medium))
           $0.numberOfLines = 0
        $0.textAlignment = .center
//           $0.text = "Hello"
           return $0
       }(UILabel())
       
       
       override init(frame: CGRect){
           super.init(frame: frame)
           setupCell()
           
       }
       
       
       required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
       override func layoutSubviews() {
           setupSizeForCellContent()
       }
       
       
       private func setupSizeForCellContent() {
           tagNameLbl.frame = CGRect(x: 10, y: self.frame.size.height / 3.0, width: self.frame.size.width - 10, height: 10)
           
       }
       
       private func setupCell() {
           self.backgroundColor = .white
           self.addSubview(tagNameLbl)
           self.layer.cornerRadius = 13
           self.layer.masksToBounds = true

       }
       
       
   }
