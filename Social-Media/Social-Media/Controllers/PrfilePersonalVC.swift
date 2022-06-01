//
//  PrfilePersonalVC.swift
//  Social-Media
//
//  Created by MacBook on 02/11/1443 AH.
//

import UIKit

class PrfilePersonalVC: UIViewController {
  
    let containerViewProfile = ShadowView()
    let upContainerViewProfile = ShadowView()
    
    let profileUsername: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        name.textColor = UIColor(#colorLiteral(red: 0.1595600843, green: 0.810018003, blue: 0.7768369317, alpha: 1))
        name.textAlignment = .center
        return name
    }()
  
    let profileImageView: UIImageView = {
        let pI = UIImageView()
        pI.contentMode = .scaleAspectFill
        pI.clipsToBounds = true
        pI.layer.cornerRadius = 80
        pI.layer.borderColor = UIColor.white.cgColor
        pI.layer.borderWidth = 1
        pI.image = UIImage(named: "unnamed")
        return pI
    }()
    
    let textNumber : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Number:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let textEmail : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Email:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let textCountry : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Country:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let textGender : UILabel = {
        $0.highlightedTextColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Gender:"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        return $0
    }(UILabel())
    
    let profileCountry : UITextField = {
    $0.placeholder = "your country"
    $0.textAlignment = .center
    $0.backgroundColor = .init(white: 0.90, alpha: 1)
    $0.layer.cornerRadius = 22.5
    return $0
}(UITextField())

    let profileGender : UITextField = {
        $0.placeholder = "your gender"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let profileEmail : UITextField = {
        $0.placeholder = "your email"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let profileNumber : UITextField = {
        $0.placeholder = "your number"
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
//        $0.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        view.addSubview(containerViewProfile)
        view.addSubview(upContainerViewProfile)
        view.addSubview(supmitButton)
        
        upContainerViewProfile.backgroundColor = .systemGray6
        containerViewProfile.backgroundColor = .gray
        upContainerViewProfile.addSubview(profileImageView)
        upContainerViewProfile.addSubview(profileUsername)
        containerViewProfile.addSubview(stackViewDataType)
        containerViewProfile.addSubview(stackViewDataProfile)
        containerViewProfile.addSubview(supmitButton)
        profileUsername.text = "Fatimah"

        supmitButton.translatesAutoresizingMaskIntoConstraints = false
        upContainerViewProfile.translatesAutoresizingMaskIntoConstraints = false
        containerViewProfile.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileUsername.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewDataType.addArrangedSubview(textNumber)
        stackViewDataType.addArrangedSubview(textEmail)
        stackViewDataType.addArrangedSubview(textCountry)
        stackViewDataType.addArrangedSubview(textGender)
        
        stackViewDataProfile.addArrangedSubview(profileNumber)
        stackViewDataProfile.addArrangedSubview(profileEmail)
        stackViewDataProfile.addArrangedSubview(profileCountry)
        stackViewDataProfile.addArrangedSubview(profileGender)
        
        
        NSLayoutConstraint.activate([
            
            upContainerViewProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            upContainerViewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upContainerViewProfile.widthAnchor.constraint(equalToConstant: 330),
            upContainerViewProfile.heightAnchor.constraint(equalToConstant: 170),
           
            containerViewProfile.topAnchor.constraint(equalTo: upContainerViewProfile.bottomAnchor, constant: 60),
            containerViewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerViewProfile.widthAnchor.constraint(equalToConstant: 360),
            containerViewProfile.heightAnchor.constraint(equalToConstant: 350),
           
            profileImageView.topAnchor.constraint(equalTo: upContainerViewProfile.topAnchor, constant: 50),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            profileImageView.centerXAnchor.constraint(equalTo: upContainerViewProfile.centerXAnchor),
            
            profileUsername.topAnchor.constraint(equalTo: upContainerViewProfile.topAnchor, constant: 10),
            profileUsername.leftAnchor.constraint(equalTo: upContainerViewProfile.leftAnchor, constant: 30),
            profileUsername.rightAnchor.constraint(equalTo: upContainerViewProfile.rightAnchor, constant: -30),
            profileUsername.bottomAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -10),

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
            supmitButton.rightAnchor.constraint(equalTo: containerViewProfile.rightAnchor, constant: -30)
        ])
        
    }
}



