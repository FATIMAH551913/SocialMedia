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
        view.backgroundColor = .yellow
        usernameLabel.text = post.owner.firstName + "" + post.owner.lastName
        postTextLabel.text = post.text
        likesLabel.text = String(post.text)
        
        
        
        setUpUI()
       
    }
    
    func setUpUI(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.backgroundColor = .yellow
        NSLayoutConstraint.activate([
            
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        
        let constraints = [
        
            postTextLabel.topAnchor.constraint(equalTo: usernameLabel.topAnchor, constant: 70),
            postTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            postTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            postTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            
            
            likesBotton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            likesBotton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            likesLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
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



