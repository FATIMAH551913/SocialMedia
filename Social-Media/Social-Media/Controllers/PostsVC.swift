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
    var tag:String?
    var page = 0
    var total = 0
    
    
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
    
    let logOutButton : UIButton = {
        $0.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        $0.layer.cornerRadius = 7.5
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    let WelcLabel : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        lbl.textColor = .white
        return lbl
    }()
    
    let NameTag : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .white
//        lbl.backgroundColor = .white
        lbl.layer.shadowRadius = 10
        lbl.layer.shadowOpacity = 1.0
        lbl.layer.shadowOffset = CGSize(width: 4, height: 4)
        lbl.layer.shadowColor = UIColor.systemRed.cgColor
        lbl.layer.cornerRadius = 30
        return lbl
    }()
    

    
    let loaderView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           getPosts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(newPostAdded), name: NSNotification.Name("NewPostAdded"), object: nil)
        
        
        
        //check if user is logged in or it's only a guest
        if let user = UserManager.loggedInUser {
            WelcLabel.text = "Hi,\(user.firstName)"
        }else{
            WelcLabel.isHidden = true
        
        }
        
        //check if there is a tag
        if let myTag = tag {
            NameTag.text = tag
            WelcLabel.isHidden = true
        }else {
            NameTag.isHidden = true
        }
        
        postTableView.delegate = self
        postTableView.dataSource = self
     
        view.addSubview(postTableView)
        view.addSubview(headerview)
        view.addSubview(allPost)
        view.addSubview(loaderView)
        view.addSubview(logOutButton)
        headerview.addSubview(WelcLabel)
        headerview.addSubview(NameTag)
        
        //هذي الخاصية تخفي الفواصل بين السل.
        postTableView.separatorStyle = .none
        postTableView.showsVerticalScrollIndicator = false
        // تخفي الظل من الصورة عند الضغط .
        //        postTableView.allowsSelection = false
        
        
        headerview.backgroundColor = .systemBrown
        loaderView.color = .blue
        loaderView.style = .medium
       
       
//        WelcLabel.backgroundColor = .white
        
       
        postTableView.backgroundColor = .systemGray6
        postTableView.register(PostCell.self, forCellReuseIdentifier: cellID )
        headerview.translatesAutoresizingMaskIntoConstraints = false
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        allPost.translatesAutoresizingMaskIntoConstraints = false
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        WelcLabel.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        NameTag.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            logOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            logOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            logOutButton.bottomAnchor.constraint(equalTo: postTableView.topAnchor, constant: -10),
            
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
            
            WelcLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            WelcLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            
            NameTag.leftAnchor.constraint(equalTo: allPost.rightAnchor, constant: 10),
            NameTag.bottomAnchor.constraint(equalTo: postTableView.topAnchor, constant: -10),
            NameTag.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            NameTag.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 70)
        ])
        
        
    

        view.backgroundColor = .white
    }
    
    
    func getPosts(){
        loaderView.startAnimating()
        PostAPI.getAllPost(page: page, tag: tag) { postsResponse,total  in
            self.total = total
            self.posts.append(contentsOf: postsResponse)
            self.postTableView.reloadData()
            self.loaderView.stopAnimating()
        }
    }
    
    
    @objc func newPostAdded(){
        self.posts = []
        self.page = 0
        getPosts()
    }
    
    @objc func logOutTapped(){
        let vc = SignInVC()
        let nav = UINavigationController()
        nav.viewControllers = [vc]
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        self.present(nav, animated: true, completion: nil)
        UserManager.loggedInUser = nil
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
        if let image = userImageStringurl{
            cell.userImg.setImageFromStringUrl(stringUrl: image)
        }
       
        //        cell.userImg.makeCircularImage()
        cell.addAction()
        cell.delegate = self
        cell.didSet()
        
        

        
        
        //filling the user Data:
        cell.username.text = post.owner.firstName + " " + post.owner.lastName
        cell.likesLbl.text = String(post.likes)
        cell.tags = post.tags ?? []
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
        return 640
    }
    //هذي الدالة تستدعي الاندكس باث وبالتالي تخبرني وين وصل المستخدم بالضبط لاي شريحة وكيف نعرف انه وصل لاخر شريحة؟ نقصنا ١ حتي يتحقق الشرط
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == posts.count - 1 && posts.count < total {
            page = page + 1
            getPosts()
        }
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


//--------------------------------------------------------شرح
//        URL(string: <#T##String#>)
//ثم نحول URLالي Data
//        Date(contentsOf: )
// ثم نعتمد علي Data من خلال UIImage inisilizer as prameter
//        cell.PostImage.image = UIImage(data: <#T##Data#>)
//-------------------------------------------------------شرح
