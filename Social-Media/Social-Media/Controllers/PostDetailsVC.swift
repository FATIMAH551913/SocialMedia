//
//  PostDetailsVC.swift
//  Social-Media
//
//  Created by MacBook on 14/07/1443 AH.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class PostDetailsVC: UIViewController {
  
    var post: Post!
    var comments:[Comment] = []
  
    
    
    let cellID = "CommentCell"
    let contentView = ShadowView()
    let containerViewTV = ShadowView()
    let usernameLabel = UILabel()
    let userImgView = UIImageView()
    let postImageView = UIImageView()
    let postTextLabel = UILabel()
    let likesBotton = UIButton()
    let likesLabel = UILabel()
    let commentsTableView = UITableView()
    let scrollView = UIScrollView()
    let contentViewScroll = UIView()
    let loding = UIActivityIndicatorView()
//    let newCommentSV : UIStackView = {
//
//    }(UIStackView())
    
    let sendbtn : UIButton = {
        $0.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        $0.addTarget(self, action: #selector(sendButtomClicked), for: .touchUpInside)
        return $0
    }(UIButton())
//    let textFieldComment = UITextField()
    let textFieldComment : UITextField = {
        $0.placeholder = "add ur Comments"
        $0.textAlignment = .center
//        $0.addTarget(self, action: #selector(sendButtomtext), for: .touchUpInside)

       
//        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 3
        return $0
    }(UITextField())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        commentsTableView.register(CommentCell.self, forCellReuseIdentifier: cellID)
        
        view.backgroundColor = .systemGray3
        usernameLabel.text = post.owner.firstName + " " + post.owner.lastName
        postTextLabel.text = post.text
        likesLabel.text = String(post.text)
        postImageView.image = UIImage(named: post.image)
        if let image = post.owner.picture {
            userImgView.setImageFromStringUrl(stringUrl: image)
        }
        userImgView.makeCircularImage()
        postImageView.setImageFromStringUrl(stringUrl: post.image)
        
        setUpUI()
        // getting the comments of the post from the API
           getPostComment()
        if UserManager.loggedInUser == nil {
            textFieldComment.isHidden = true
            sendbtn.isHidden = true
            
        }
    }
    
    
    func getPostComment(){
        loding.startAnimating()
        PostAPI.getPostComment(id: post.id) { commentsResponse in
            self.comments = commentsResponse
            self.commentsTableView.reloadData()
            self.loding.stopAnimating()
        }
    }
    
   
    @objc func sendButtomClicked(){
        let message = textFieldComment.text!
        if let user = UserManager.loggedInUser {
            loding.startAnimating()
            PostAPI.addNewCommentToPost(postId: post.id, userId: user.id  , message: message) {
                self.getPostComment()
                self.textFieldComment.text = ""
            }
        }
    }
    

    func setUpUI(){
        
        textFieldComment.translatesAutoresizingMaskIntoConstraints = false
        sendbtn.translatesAutoresizingMaskIntoConstraints = false
        loding.translatesAutoresizingMaskIntoConstraints = false
        contentViewScroll.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        containerViewTV.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentViewScroll)
        contentViewScroll.addSubview(contentView)
        contentViewScroll.addSubview(containerViewTV)

        containerViewTV.addSubview(loding)
        containerViewTV.addSubview(sendbtn)
        containerViewTV.addSubview(textFieldComment)
        containerViewTV.addSubview(commentsTableView)
        
        
        
        scrollView.backgroundColor = .systemGray6
        loding.color = .blue
        containerViewTV.backgroundColor = .green
        contentViewScroll.backgroundColor = .yellow
        contentView.backgroundColor = .white
        commentsTableView.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentViewScroll.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentViewScroll.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentViewScroll.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentViewScroll.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 600),
            contentViewScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentViewScroll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.rightAnchor.constraint(equalTo: contentViewScroll.rightAnchor,constant: -8),
            contentView.leftAnchor.constraint(equalTo: contentViewScroll.leftAnchor,constant: 8),
            contentView.topAnchor.constraint(equalTo: contentViewScroll.topAnchor,constant: 10),
            contentView.bottomAnchor.constraint(equalTo: contentViewScroll.bottomAnchor,constant: -1000),
//            contentView.heightAnchor.constraint(equalTo: contentViewScroll.heightAnchor, constant: 100),
            
            containerViewTV.rightAnchor.constraint(equalTo: contentViewScroll.rightAnchor,constant: -8),
            containerViewTV.leftAnchor.constraint(equalTo: contentViewScroll.leftAnchor,constant: 8),
            containerViewTV.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 10 ),
            containerViewTV.bottomAnchor.constraint(equalTo: contentViewScroll.bottomAnchor,constant: -10),
            containerViewTV.heightAnchor.constraint(equalTo: commentsTableView.heightAnchor, constant: 100),
            
            commentsTableView.rightAnchor.constraint(equalTo: containerViewTV.rightAnchor),
            commentsTableView.leftAnchor.constraint(equalTo: containerViewTV.leftAnchor),
            commentsTableView.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 10 ),
            commentsTableView.bottomAnchor.constraint(equalTo: containerViewTV.bottomAnchor),
            
            loding.rightAnchor.constraint(equalTo: commentsTableView.rightAnchor,constant: -40),
            loding.leftAnchor.constraint(equalTo: commentsTableView.leftAnchor, constant: 40),
            loding.bottomAnchor.constraint(equalTo: containerViewTV.bottomAnchor, constant: -70),
            loding.topAnchor.constraint(equalTo: commentsTableView.topAnchor, constant: 80),
       
            sendbtn.topAnchor.constraint(equalTo: commentsTableView.bottomAnchor, constant: 35),
            sendbtn.rightAnchor.constraint(equalTo: containerViewTV.rightAnchor, constant: -15),
            
            textFieldComment.topAnchor.constraint(equalTo: commentsTableView.bottomAnchor, constant: 20),
            textFieldComment.leftAnchor.constraint(equalTo: containerViewTV.leftAnchor, constant: 20),
            textFieldComment.rightAnchor.constraint(equalTo: containerViewTV.rightAnchor, constant: -40),
            textFieldComment.bottomAnchor.constraint(equalTo: containerViewTV.bottomAnchor, constant: -25)
            
            
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
            
            postImageView.topAnchor.constraint(equalTo: postTextLabel.topAnchor, constant: 100),
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            postImageView.rightAnchor.constraint(equalTo:contentView.rightAnchor, constant: -10),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
        
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
            userImgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -320),
            userImgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -380),

            
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            usernameLabel.leftAnchor.constraint(equalTo: userImgView.rightAnchor, constant: 20),
            usernameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 10),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}



extension PostDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CommentCell
       let currentComment = comments[indexPath.row]
       
        cell.usernameComment.text = currentComment.owner.firstName + " " + currentComment.owner.lastName
        cell.lblComment.text = currentComment.message
        
        if let userImage = currentComment.owner.picture{
            cell.userImgComment.setImageFromStringUrl(stringUrl: userImage)
        }

        

       
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
}

