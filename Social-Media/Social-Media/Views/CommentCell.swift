//
//  CommentCell.swift
//  Social-Media
//
//  Created by MacBook on 18/07/1443 AH.
//

import UIKit

class CommentCell: UITableViewCell {

    let lblComment : UILabel = {
//        $0.text = "text"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let userImgComment : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 17
//        $0.image = UIImage(systemName: "person.fill")
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())
    
    let usernameComment : UILabel = {
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .left
//        $0.text = "Text"
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
        self.addSubview(usernameComment)
        self.addSubview(userImgComment)
        
        NSLayoutConstraint.activate([
            
            lblComment.topAnchor.constraint(equalTo: userImgComment.topAnchor,constant: 20),
            lblComment.rightAnchor.constraint(equalTo: rightAnchor,constant: -10),
            lblComment.leftAnchor.constraint(equalTo: leftAnchor,constant: 25),
            lblComment.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            
            userImgComment.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            userImgComment.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            userImgComment.rightAnchor.constraint(equalTo: rightAnchor, constant: -325),
            userImgComment.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -57),

            usernameComment.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            usernameComment.leftAnchor.constraint(equalTo: userImgComment.rightAnchor, constant: 15),
            usernameComment.widthAnchor.constraint(equalTo: widthAnchor, constant: 70),
            
        ])
        
    }

}
