//
//  CommentCell.swift
//  Social-Media
//
//  Created by MacBook on 18/07/1443 AH.
//

import UIKit

class CommentCell: UITableViewCell {

    let lblComment : UILabel = {
        $0.text = "text"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .black
        return $0
    }(UILabel())
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.addSubview(lblComment)
        NSLayoutConstraint.activate([
            lblComment.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            lblComment.rightAnchor.constraint(equalTo: rightAnchor),
            lblComment.leftAnchor.constraint(equalTo: leftAnchor),
            lblComment.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 30),
            lblComment.heightAnchor.constraint(equalTo: heightAnchor, constant: 120)
        
        
        ])
        
    }

}
