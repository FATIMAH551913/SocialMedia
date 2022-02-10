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
    
    
    let PostImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleAspectFill
        
        return image
    }()

    let stackView : UIStackView = {

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
      return stack
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpView()
    }
    
    func setUpView(){
//        self.addSubview(username)
//        self.addSubview(postTextLbl)
        self.addSubview(PostImage)

        self.addSubview(stackView)
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(postTextLbl)
//        stackView.addArrangedSubview(PostImage)
       
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
//            stackView.bottomAnchor.constraint(equalTo: PostImage.bottomAnchor, constant: -5)
            
            
//            username.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            username.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
//            username.bottomAnchor.constraint(equalTo: PostImage.topAnchor, constant: 1),
////            username.heightAnchor.constraint(equalTo: heightAnchor, constant: 10),
//
//            username.widthAnchor.constraint(equalTo: widthAnchor, constant: 150),
//
//            postTextLbl.topAnchor.constraint(equalTo: topAnchor, constant: 20),
//            postTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
//            postTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
//            postTextLbl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([

            PostImage.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 20),
            PostImage.rightAnchor.constraint(equalTo:rightAnchor, constant: -5),
            PostImage.leftAnchor.constraint(equalTo:leftAnchor, constant: 5),
            PostImage.heightAnchor.constraint(equalToConstant: 200),
//            PostImage.heightAnchor.constraint(equalTo: heightAnchor, constant: 20),
//            PostImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        
    }
}
