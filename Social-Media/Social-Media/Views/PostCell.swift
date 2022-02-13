//
//  TVcellTableViewCell.swift
//  Social-Media
//
//  Created by MacBook on 08/07/1443 AH.
//

import UIKit

class PostCell: UITableViewCell {
    
    let postTextLbl : UILabel = {
        let namelbl = UILabel()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        namelbl.textAlignment = .left
        namelbl.textColor = .black
        namelbl.numberOfLines = 0
        namelbl.backgroundColor = .yellow
        return namelbl
    }()
    
    let username : UILabel = {
       let un = UILabel()
        un.textColor = .black
//        un.text = "hi"
        un.translatesAutoresizingMaskIntoConstraints = false
        un.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        un.textAlignment = .left
        un.backgroundColor = .green
        return un
    }()
    
    
    let postImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
//        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    let userImg : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleAspectFit

        return image
    }()

//    let stackView : UIStackView = {
//
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
//        stack.spacing = 10
//      return stack
//    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpView()
        self.backgroundColor = .systemBrown
        
    }
    
    
    func setUpView(){

        self.addSubview(postImage)
        self.addSubview(userImg)
        self.addSubview(username)
        self.addSubview(postTextLbl)
        
        NSLayoutConstraint.activate([
            
            
            userImg.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            userImg.rightAnchor.constraint(equalTo: rightAnchor, constant: -340),
            userImg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -340),
//            userImg.heightAnchor.constraint(equalTo: heightAnchor, constant: 40),
//            userImg.widthAnchor.constraint(equalTo: widthAnchor, constant: 40),
            
            
            postImage.topAnchor.constraint(equalTo: topAnchor,constant: 130),
            postImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            postImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            postImage.heightAnchor.constraint(equalToConstant: 200),
            
            
            username.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            username.leftAnchor.constraint(equalTo: userImg.rightAnchor, constant: 10),
            username.widthAnchor.constraint(equalTo: widthAnchor, constant: 10),
            
            
            postTextLbl.topAnchor.constraint(equalTo: username.topAnchor, constant: 50),
            postTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            postTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -7),
            
            
        ])
        
    }
}
