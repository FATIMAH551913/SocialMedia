//
//  TagsCVCell.swift
//  Social-Media
//
//  Created by MacBook on 10/10/1443 AH.
//

import UIKit

class TagCell: UICollectionViewCell {
    
 let tagNameLbl: UILabel = {
        $0.textColor =  UIColor.label
        $0.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .medium))
        $0.numberOfLines = 0
//        $0.text = "Hello"
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
        

        tagNameLbl.frame = CGRect(x: 14, y: self.frame.size.height / 2.02, width: self.frame.size.width - 14, height: 30)

        
    }
    
    private func setupCell() {
        self.backgroundColor = UIColor(named: "BottomColor")
        self.addSubview(tagNameLbl)
        self.layer.cornerRadius = 13
        self.layer.masksToBounds = true

        
        
    }
    
    
}
