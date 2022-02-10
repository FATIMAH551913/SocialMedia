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
//        namelbl.alignmentRectInsets = .fill
        namelbl.textColor = .black
        namelbl.numberOfLines = 0
//        namelbl.backgroundColor = .yellow
        return namelbl
    }()
    
    
    let PostImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.image = UIImage(named: "unnamed")
        
        return image
    }()
//
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
    }
    
    func setUpView(){
        self.addSubview(postTextLbl)
        self.addSubview(PostImage)

//        self.addSubview(stackView)
//        stackView.addArrangedSubview(postTextLbl)
//        stackView.addArrangedSubview(PostImage)
        
        
        
        NSLayoutConstraint.activate([

            postTextLbl.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            postTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            postTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            postTextLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
//            postTextLbl.heightAnchor.constraint(equalTo: heightAnchor, constant: 30),
//            postTextLbl.bottomAnchor.constraint(equalTo: PostImage.topAnchor, constant: -10),
            
            
            PostImage.topAnchor.constraint(equalTo: postTextLbl.bottomAnchor, constant: 10),
            PostImage.rightAnchor.constraint(equalTo:rightAnchor, constant: -10),
            PostImage.leftAnchor.constraint(equalTo:leftAnchor, constant: 10),
//            PostImage.widthAnchor.constraint(equalTo: widthAnchor,constant: 120),
//            PostImage.heightAnchor.constraint(equalTo: heightAnchor, constant: 70),
            PostImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        
    }
}
