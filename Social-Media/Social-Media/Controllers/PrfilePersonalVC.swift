//
//  PrfilePersonalVC.swift
//  Social-Media
//
//  Created by MacBook on 02/11/1443 AH.
//

import UIKit
import NVActivityIndicatorView

class PrfilePersonalVC: UIViewController {
  
    let containerViewProfile = ShadowView()
    let upContainerViewProfile = ShadowView()
    let loaderView = UIActivityIndicatorView()
    
    let username: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor = UIColor(#colorLiteral(red: 0.1595600843, green: 0.810018003, blue: 0.7768369317, alpha: 1))
        name.textAlignment = .center
        return name
    }()
  
    let userImageView: UIImageView = {
        let pI = UIImageView()
        pI.contentMode = .scaleAspectFill
        pI.clipsToBounds = true
        pI.layer.cornerRadius = 80
        pI.layer.borderColor = UIColor.white.cgColor
        pI.layer.borderWidth = 1
//        pI.image = UIImage(named: "unnamed")
        return pI
    }()
    
    let firstNameLbl : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "First Name:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let phoneNumLbl : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Phone:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let imageUrlLbl : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Image Url:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let firstNameTF : UITextField = {
    $0.textAlignment = .center
    $0.backgroundColor = .init(white: 0.90, alpha: 1)
    $0.layer.cornerRadius = 22.5
    return $0
}(UITextField())

    let phoneNumTF : UITextField = {
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let imageUrlTF : UITextField = {
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let stackViewDataProfile : UIStackView = {
          let stack = UIStackView()
          stack.translatesAutoresizingMaskIntoConstraints = false
          stack.axis = .vertical
        stack.distribution = .fillEqually
          stack.spacing = 3
        return stack
      }()
    
    let stackViewDataType : UIStackView = {
          let stack = UIStackView()
          stack.translatesAutoresizingMaskIntoConstraints = false
          stack.axis = .vertical
        stack.distribution = .fillEqually
          stack.spacing = 3
        return stack
      }()
    
    let supmitButton : UIButton = {
        $0.setTitle("Supmit", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 22.5
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(supmitClicked), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
        
        loaderView.color = .blue
        loaderView.style = .large
        view.backgroundColor = .white
        view.addSubview(containerViewProfile)
        view.addSubview(upContainerViewProfile)
        view.addSubview(supmitButton)
        view.addSubview(loaderView)
        
        upContainerViewProfile.backgroundColor = .systemGray6
        containerViewProfile.backgroundColor = .gray
        upContainerViewProfile.addSubview(userImageView)
        upContainerViewProfile.addSubview(username)
        containerViewProfile.addSubview(stackViewDataType)
        containerViewProfile.addSubview(stackViewDataProfile)
        containerViewProfile.addSubview(supmitButton)

        loaderView.translatesAutoresizingMaskIntoConstraints = false
        supmitButton.translatesAutoresizingMaskIntoConstraints = false
        upContainerViewProfile.translatesAutoresizingMaskIntoConstraints = false
        containerViewProfile.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        username.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewDataType.addArrangedSubview(firstNameLbl)
        stackViewDataType.addArrangedSubview(phoneNumLbl)
        stackViewDataType.addArrangedSubview(imageUrlLbl)
        
        stackViewDataProfile.addArrangedSubview(firstNameTF)
        stackViewDataProfile.addArrangedSubview(phoneNumTF)
        stackViewDataProfile.addArrangedSubview(imageUrlTF)
        
        NSLayoutConstraint.activate([
            upContainerViewProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            upContainerViewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upContainerViewProfile.widthAnchor.constraint(equalToConstant: 330),
            upContainerViewProfile.heightAnchor.constraint(equalToConstant: 170),

            containerViewProfile.topAnchor.constraint(equalTo: upContainerViewProfile.bottomAnchor, constant: 70),
            containerViewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerViewProfile.widthAnchor.constraint(equalToConstant: 360),
            containerViewProfile.heightAnchor.constraint(equalToConstant: 250),
           
            userImageView.topAnchor.constraint(equalTo: upContainerViewProfile.topAnchor, constant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 160),
            userImageView.heightAnchor.constraint(equalToConstant: 160),
            userImageView.centerXAnchor.constraint(equalTo: upContainerViewProfile.centerXAnchor),
            
            username.topAnchor.constraint(equalTo: upContainerViewProfile.topAnchor, constant: 10),
            username.leftAnchor.constraint(equalTo: upContainerViewProfile.leftAnchor, constant: 30),
            username.rightAnchor.constraint(equalTo: upContainerViewProfile.rightAnchor, constant: -30),
            username.bottomAnchor.constraint(equalTo: userImageView.topAnchor, constant: -10),

            stackViewDataProfile.topAnchor.constraint(equalTo: containerViewProfile.topAnchor, constant: 35),
            stackViewDataProfile.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 100),
            stackViewDataProfile.rightAnchor.constraint(equalTo: containerViewProfile.rightAnchor, constant: -15),
            stackViewDataProfile.bottomAnchor.constraint(equalTo: containerViewProfile.bottomAnchor, constant: -35),
            
            stackViewDataType.topAnchor.constraint(equalTo: containerViewProfile.topAnchor, constant: 35),
            stackViewDataType.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 10),
            stackViewDataType.rightAnchor.constraint(equalTo: containerViewProfile.rightAnchor, constant: -100),
            stackViewDataType.bottomAnchor.constraint(equalTo: containerViewProfile.bottomAnchor, constant: -35),
            
            supmitButton.topAnchor.constraint(equalTo: stackViewDataType.bottomAnchor, constant: 15),
            supmitButton.centerXAnchor.constraint(equalTo: containerViewProfile.centerXAnchor),
            supmitButton.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 30),
            supmitButton.rightAnchor.constraint(equalTo: containerViewProfile.rightAnchor, constant: -30),
            
            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 120),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 120),
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func setUpUi(){
        if let user = UserManager.loggedInUser {
            if let image = user.picture {
                userImageView.setImageFromStringUrl(stringUrl: image)
            }
            
            username.text = user.firstName + " " + user.lastName
            firstNameTF.text = user.firstName
            phoneNumTF.text = user.phone
            imageUrlTF.text = user.picture
        }
    }
    @objc func supmitClicked(){
        guard let logedInuser = UserManager.loggedInUser else {return}
        loaderView.startAnimating()
        UserAPI.updateUserInfo(
                        userId: logedInuser.id,
                        firstName:firstNameTF.text!,
                        phone:phoneNumTF.text! ,
                        imageUrl: imageUrlTF.text!)
        { user, message in
            self.loaderView.stopAnimating()
            if let respounseUser = user {
                if let image = user?.picture {
                self.userImageView.setImageFromStringUrl(stringUrl: image)
                }
                self.username.text = respounseUser.firstName + " " + respounseUser.lastName
                
                
            }
        }
    }
}



