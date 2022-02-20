//
//  PostDetailsVC.swift
//  Social-Media
//
//  Created by MacBook on 14/07/1443 AH.
//

import UIKit
import Alamofire
import SwiftyJSON

class PostDetailsVC: UIViewController {
  
    
    var post: Post!
    var comments:[Comment] = []
    
    let cellID = "CommentCell"
    let contentView = UIView()
    let usernameLabel = UILabel()
    let userImgView = UIImageView()
    let postImageView = UIImageView()
    let postTextLabel = UILabel()
    let likesBotton = UIButton()
    let likesLabel = UILabel()
    let commentsTableView = UITableView()
    let scrollView = UIScrollView()
    let contentViewScroll = UIView()
   
    
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
        userImgView.setImageFromStringUrl(stringUrl: post.owner.picture)
        userImgView.makeCircularImage()
        postImageView.setImageFromStringUrl(stringUrl: post.image)
        
        setUpUI()
        // getting the comments of the post from the API
//        let url = "https://dummyapi.io/data/v1/post/60d21af267d0d8992e610b8d/comment"
        let url = "https://dummyapi.io/data/v1/post/\(post.id)/comment" // اسمها سكيب للستنرنق
        let appId = "6202a19d8e6ae0624211e23b"
        
        
        let headers: HTTPHeaders = [
            "app-id" : appId
        ]
        AF.request(url, headers: headers).responseJSON { response in
            //            print(response.value)
            //نستخدم منغير اسمه جيسنداتا من سويفتي جيسن
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            //Decoding :
            let decoder = JSONDecoder()
            do {
                self.comments = try decoder.decode([Comment].self, from: data.rawData())
                self.commentsTableView.reloadData()
                
            }catch let error {
                // تعريف الايرور هنا يفيدني انه راح يحدد لي ايش نوع الخطآ بالتحديد اوضح من ايرور شكل سترنق .
                print(error)
            }

        }
    }
    
    
    
    func setUpUI(){
        
        contentViewScroll.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        contentViewScroll.addSubview(contentView)
        contentViewScroll.addSubview(commentsTableView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentViewScroll)
        
        scrollView.backgroundColor = .white
        contentViewScroll.backgroundColor = .white
        contentView.backgroundColor = .white
        commentsTableView.backgroundColor = .white
        
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contentView.layer.shadowRadius = 10   //مقدار تجمع الظل
        contentView.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
        contentView.layer.cornerRadius = 7
        
        
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
            
            
            commentsTableView.rightAnchor.constraint(equalTo: contentViewScroll.rightAnchor,constant: -8),
            commentsTableView.leftAnchor.constraint(equalTo: contentViewScroll.leftAnchor,constant: 8),
            commentsTableView.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 10 ),
            commentsTableView.bottomAnchor.constraint(equalTo: contentViewScroll.bottomAnchor,constant: -10),
            
            
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
        cell.lblComment.text = currentComment.message
        cell.usernameComment.text = currentComment.owner.firstName + " " + currentComment.owner.lastName
        let userImageStringurl = currentComment.owner.picture
        cell.userImgComment.setImageFromStringUrl(stringUrl: userImageStringurl)
//        cell.userImgComment.makeCircularImage()
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
}

