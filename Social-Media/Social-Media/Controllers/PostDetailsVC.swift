//
//  PostDetailsVC.swift
//  Social-Media
//
//  Created by MacBook on 14/07/1443 AH.
//

import UIKit

class PostDetailsVC: UIViewController {
    var post: Post!
    
    let contentView = UIView()
    let usernameLabel = UILabel()
    let userImgView = UIImageView()
    let postImageView = UIImageView()
    let postTextLabel = UILabel()
    let likesBotton = UIButton()
    let likesLabel = UILabel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        usernameLabel.text = post.owner.firstName + " " + post.owner.lastName
        postTextLabel.text = post.text
        likesLabel.text = String(post.text)
        postImageView.image = UIImage(named: post.image)
//        userImgView.image = post.owner.picture
        
        
        setUpUI()
       
    }
    
    func setUpUI(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contentView.layer.shadowRadius = 10   //مقدار تجمع الظل
        contentView.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
        contentView.layer.cornerRadius = 7
        
        
        NSLayoutConstraint.activate([
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -8),
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 8),
            contentView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -200)
        ])
        
        contentView.addSubview(userImgView)
        userImgView.translatesAutoresizingMaskIntoConstraints = false
        userImgView.layer.cornerRadius = 17
        userImgView.layer.masksToBounds = true
        userImgView.contentMode = .scaleAspectFill
        
        contentView.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        usernameLabel.textAlignment = .left
        
        contentView.addSubview(postTextLabel)
        postTextLabel.translatesAutoresizingMaskIntoConstraints = false
        postTextLabel.textAlignment = .left
        postTextLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
    
        contentView.addSubview(likesBotton)
        likesBotton.translatesAutoresizingMaskIntoConstraints = false
        likesBotton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        likesBotton.tintColor = .blue
    
        contentView.addSubview(likesLabel)
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.textAlignment = .center
        likesLabel.text = "5"
        
        let constraints = [
        
            postTextLabel.topAnchor.constraint(equalTo: usernameLabel.topAnchor, constant: 10),
            postTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            postTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            postTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -300),
            
            
            likesBotton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            likesBotton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            likesLabel.leftAnchor.constraint(equalTo: likesBotton.rightAnchor, constant: 10),
            

            userImgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userImgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            userImgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -330),
            userImgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -330),


            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            usernameLabel.leftAnchor.constraint(equalTo: userImgView.rightAnchor, constant: 20),
            usernameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 10),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}



