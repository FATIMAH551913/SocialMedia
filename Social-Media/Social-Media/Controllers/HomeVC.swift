//
//  HomeVC.swift
//  Social-Media
//
//  Created by MacBook on 07/07/1443 AH.
//

import UIKit
import Alamofire
import SwiftyJSON
// اقدر اخذ (respose.value)واضعها داخل اوبجيكت او كلاس JSON جاي من سويفت جيسن

class HomeVC: UIViewController {
    
    var posts:[Post] = []
    
    let cellID = "PostCell"
    let postTableView = UITableView()
    let headerview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.delegate = self
        postTableView.dataSource = self
        
        view.addSubview(postTableView)
        view.addSubview(headerview)
        
        headerview.backgroundColor = .systemGray6
        postTableView.backgroundColor = .white
        postTableView.register(PostCell.self, forCellReuseIdentifier: cellID )
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            headerview.topAnchor.constraint(equalTo: view.topAnchor),
            headerview.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerview.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerview.bottomAnchor.constraint(equalTo: postTableView.topAnchor),
            
            postTableView.topAnchor.constraint(equalTo:view.topAnchor, constant: 200),
            postTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            postTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
           
        
        let appId = "6202a19d8e6ae0624211e23b"
        let url = "https://dummyapi.io/data/v1/post"
        
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
                self.posts = try decoder.decode([Post].self, from: data.rawData())
                self.postTableView.reloadData() 
            }catch let error {
                // تعريف الايرور هنا يفيدني انه راح يحدد لي ايش نوع الخطآ بالتحديد اوضح من ايرور شكل سترنق .
                print(error)
            }
            print(data)
        }
        view.backgroundColor = .white
    }
    
}

extension HomeVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID ) as! PostCell
        let post = posts[indexPath.row]//يجيب لي البوست الحالي
        cell.postTextLbl.text = post.text// راح اعبيه في هذي الخلية
        
        // the logic of filling the image frome url?
     //كيف اعرض صوره بالانترنت في imageView من رابط نوع string الي imageView كالتالي:
        //نحول الصورة الي URL
        let imageStringUrl = post.image
        if let url = URL(string: imageStringUrl) {
            if let imageData = try? Data(contentsOf: url){
                cell.PostImage.image = UIImage(data: imageData)
            }
            
        }
 //--------------------------------------------------------شرح
//        URL(string: <#T##String#>)
        //ثم نحول URLالي Data
//        Date(contentsOf: )
        // ثم نعتمد علي Data من خلال UIImage inisilizer as prameter
//        cell.PostImage.image = UIImage(data: <#T##Data#>)
        //-------------------------------------------------------شرح
        
        //filling the user Data:
        cell.username.text = post.owner.firstName + " " + post.owner.lastName
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
