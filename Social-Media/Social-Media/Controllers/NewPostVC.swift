//
//  NewPostVC.swift
//  Social-Media
//
//  Created by MacBook on 01/11/1443 AH.
//

import UIKit
import NVActivityIndicatorView


class NewPostVC: UIViewController {
   
    let containerViewBackground = UIView ()
    let containerViewColor = UIView ()
    let loaderView = UIActivityIndicatorView()
    let postTextField : UITextField = {
        $0.placeholder = "Post Text"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let postimageTextField : UITextField = {
        $0.placeholder = "Post image"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
  
    let addPost : UIButton = {
        $0.setTitle("Add", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 22.5
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(addPostButtonClicked), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    
    let stackView : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
           setUp()
        loaderView.color = .blue
        loaderView.style = .large
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    @objc func addPostButtonClicked(){
        if let user = UserManager.loggedInUser {
            addPost.setTitle(" ", for: .normal)
            loaderView.startAnimating()
            PostAPI.addNewPost(text: postTextField.text!, userId: user.id) {
                self.loaderView.stopAnimating()
                self.addPost.setTitle("Add", for: .normal)
                NotificationCenter.default.post(name: NSNotification.Name("NewPostAdded"), object: nil, userInfo: nil)
                self.postTextField.text = ""
                   
            }
        }
    }
}

extension NewPostVC {
    func setUp() {
       
      
        view.addSubview(stackView)
//        view.addSubview(containerViewBackground)
        stackView.addArrangedSubview(postTextField)
        stackView.addArrangedSubview(postimageTextField)
        stackView.addArrangedSubview(addPost)
        view.addSubview(loaderView)
      
        containerViewBackground.translatesAutoresizingMaskIntoConstraints = false
        containerViewColor.translatesAutoresizingMaskIntoConstraints = false
     
        NSLayoutConstraint.activate([
            
            
            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 150),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 150),
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:200),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 210),
         
            ])
            
            }
        }
