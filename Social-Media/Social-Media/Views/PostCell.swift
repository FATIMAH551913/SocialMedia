//
//  TVcellTableViewCell.swift
//  Social-Media
//
//  Created by MacBook on 08/07/1443 AH.
//

import UIKit

class PostCell: UITableViewCell {
    
   
    let purNamLbl : UILabel = {
        
        let namelbl = UILabel()
        namelbl.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        namelbl.textAlignment = .center
        namelbl.textColor = .black
        namelbl.text = "Hi"
        return namelbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//       setUpView()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpView()
    }
    
    func setUpView(){
        self.addSubview(purNamLbl)
    
        
        purNamLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//
//            purNamLbl.topAnchor.constraint(equalTo:topAnchor, constant: 20),
//            purNamLbl.rightAnchor.constraint(equalTo:self.rightAnchor, constant: -10),
//            purNamLbl.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 10),
            purNamLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            purNamLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
    }
}
