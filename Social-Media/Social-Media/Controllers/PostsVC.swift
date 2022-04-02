//
//  HomeVC.swift
//  Social-Media
//
//  Created by MacBook on 07/07/1443 AH.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
// اقدر اخذ (respose.value)واضعها داخل اوبجيكت او كلاس JSON جاي من سويفت جيسن

class PostsVC: UIViewController {
    
    var posts:[Post] = []
    
    
    let cellID = "PostCell"
    let postTableView = UITableView()
    let headerview = UIView()
    let allPost : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lbl.text = "All Posts"
        return lbl
    }()
    
    let loaderView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.delegate = self
        postTableView.dataSource = self
        
        view.addSubview(postTableView)
        view.addSubview(headerview)
        view.addSubview(allPost)
        view.addSubview(loaderView)
        
        //هذي الخاصية تخفي الفواصل بين السل.
        postTableView.separatorStyle = .none
        // تخفي الظل من الصورة عند الضغط .
        //        postTableView.allowsSelection = false
        
        
        headerview.backgroundColor = .systemBrown
        loaderView.color = .blue
        loaderView.style = .medium
        
        
        postTableView.backgroundColor = .systemGray6
        postTableView.register(PostCell.self, forCellReuseIdentifier: cellID )
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        allPost.translatesAutoresizingMaskIntoConstraints = false
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 120),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 120),
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            headerview.topAnchor.constraint(equalTo: view.topAnchor),
            headerview.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerview.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerview.bottomAnchor.constraint(equalTo: postTableView.topAnchor),
            
            postTableView.topAnchor.constraint(equalTo:view.topAnchor, constant: 200),
            postTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            postTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            allPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            allPost.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
        ])
        
        loaderView.startAnimating()
        PostAPI.getAllPost { postsResponse in
            self.posts = postsResponse
            self.postTableView.reloadData()
            self.loaderView.stopAnimating()
        }
        
        view.backgroundColor = .white
        
    }
    
}

extension PostsVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID ) as! PostCell
        
        let post = posts[indexPath.row]//يجيب لي البوست الحالي
        cell.postTextLbl.text = post.text// راح اعبيه في هذي الخلية
       
        // the logic of filling the post image frome url?
        
        //كيف اعرض صوره بالانترنت في imageView من رابط نوع string الي imageView كالتالي:
        //نحول الصورة الي URL
        let imageStringUrl = post.image
        cell.postImage.setImageFromStringUrl(stringUrl: imageStringUrl)
        //the logic of filling the user's image frim the url:
        let userImageStringurl = post.owner.picture
        cell.userImg.setImageFromStringUrl(stringUrl: userImageStringurl)
        //        cell.userImg.makeCircularImage()
        cell.addAction()
        cell.delegate = self
        
        
        
        
        //--------------------------------------------------------شرح
        //        URL(string: <#T##String#>)
        //ثم نحول URLالي Data
        //        Date(contentsOf: )
        // ثم نعتمد علي Data من خلال UIImage inisilizer as prameter
        //        cell.PostImage.image = UIImage(data: <#T##Data#>)
        //-------------------------------------------------------شرح
        
        
        
        //filling the user Data:
        cell.username.text = post.owner.firstName + " " + post.owner.lastName
        cell.likesLbl.text = String(post.likes)
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedPost = posts[indexPath.row]
        let vc = PostDetailsVC()
        
        vc.post = selectedPost
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}

extension PostsVC : PostCellDelegate {
    
    
    func userProfileTapped(cell:UITableViewCell) {
        print("I am here")
        if let inedxPath = postTableView.indexPath(for: cell){
            let post = posts[inedxPath.row]
           
            let vc = ProfileVC()
            vc.user = post.owner
            navigationController?.pushViewController(vc, animated: true)

        }
     
    }
    
    
    
    
}

// شرح علي المطرفي للجيسن:
// ١- اسوي سترنق من جيسن.
//٢- اسوي دي كودنق.
//٣- التايب كان عباره عن ستركت من نوع كودابل واستخدمنا اسم الستركت.



//        let appId = "6202a19d8e6ae0624211e23b"
//        let url = "https://dummyapi.io/data/v1/post"
//
//
//        let headers: HTTPHeaders = [
//            "app-id" : appId
//        ]
//
//        loaderView.startAnimating()
//
//        AF.request(url, headers: headers).responseJSON { [self] response in
//            loaderView.stopAnimating()
//            //            print(response.value)
//            //نستخدم منغير اسمه جيسنداتا من سويفتي جيسن
//            let jsonData = JSON(response.value)
//            let data = jsonData["data"]
//            //Decoding :
//            let decoder = JSONDecoder()
//            do {
//                self.posts = try decoder.decode([Post].self, from: data.rawData())
//                self.postTableView.reloadData()
//            }catch let error {
//                // تعريف الايرور هنا يفيدني انه راح يحدد لي ايش نوع الخطآ بالتحديد اوضح من ايرور شكل سترنق .
//                print(error)
//            }
//            print(data)
//        }
