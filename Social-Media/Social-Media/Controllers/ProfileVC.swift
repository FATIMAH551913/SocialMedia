//
//  ProfileVC.swift
//  Social-Media
//
//  Created by MacBook on 27/07/1443 AH.
//

import UIKit


class ProfileVC: UIViewController {

    
    var user: User!
    
    let containerViewProfile = ShadowView()
    
    
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
        return pI
    }()
    let profileNumber = UILabel()
    
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
    let profileCountry = UILabel()
    let profileGender = UILabel()
    let profileEmail = UILabel()
    
    let stackViewDataProfile : UIStackView = {
          let stack = UIStackView()
          stack.translatesAutoresizingMaskIntoConstraints = false
          stack.axis = .vertical
        stack.distribution = .equalSpacing
          stack.spacing = 7
        return stack
      }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    
        
        
        UserAPI.getUserData(id: user.id) { userResponse in
            self.user = userResponse
            self.setUpUI()
        }

        view.backgroundColor = .white
        view.addSubview(containerViewProfile)
        containerViewProfile.backgroundColor = .gray
        containerViewProfile.addSubview(stackViewDataProfile)
        containerViewProfile.addSubview(profileImageView)
        containerViewProfile.addSubview(profileUsername)
        containerViewProfile.addSubview(textNumber)
        containerViewProfile.addSubview(textEmail)
        containerViewProfile.addSubview(textCountry)
        containerViewProfile.addSubview(textGender)
//        profileUsername.text = "Fatimah"

       
        containerViewProfile.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileUsername.translatesAutoresizingMaskIntoConstraints = false
       
        stackViewDataProfile.addArrangedSubview(profileNumber)
        stackViewDataProfile.addArrangedSubview(profileEmail)
        stackViewDataProfile.addArrangedSubview(profileCountry)
        stackViewDataProfile.addArrangedSubview(profileGender)
        
        
//        profileNumber.text = "000000000000"
//        profileEmail.text = "examle@examle.com"
//        profileGender.text = "Femal"
//        profileCountry.text = "Saudia Arabia"
        
        
        NSLayoutConstraint.activate([
            containerViewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerViewProfile.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerViewProfile.widthAnchor.constraint(equalToConstant: 325),
            containerViewProfile.heightAnchor.constraint(equalToConstant: 480),
           
            profileImageView.topAnchor.constraint(equalTo: containerViewProfile.topAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            profileImageView.centerXAnchor.constraint(equalTo: containerViewProfile.centerXAnchor),
            
            profileUsername.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            profileUsername.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 30),
            profileUsername.rightAnchor.constraint(equalTo: containerViewProfile.rightAnchor, constant: -30),
            
            textNumber.topAnchor.constraint(equalTo: profileUsername.topAnchor, constant: 60),
            textNumber.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 10),
            
            textEmail.topAnchor.constraint(equalTo: textNumber.topAnchor, constant: 60),
            textEmail.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 10),
            
            textCountry.topAnchor.constraint(equalTo: textEmail.topAnchor, constant: 60),
            textCountry.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 10),
            
            textGender.topAnchor.constraint(equalTo: textCountry.topAnchor, constant: 60),
            textGender.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 10),
            
            stackViewDataProfile.topAnchor.constraint(equalTo: profileUsername.bottomAnchor, constant: 10),
            stackViewDataProfile.leftAnchor.constraint(equalTo: containerViewProfile.leftAnchor, constant: 100),
            stackViewDataProfile.rightAnchor.constraint(equalTo: containerViewProfile.rightAnchor, constant: -15),
            stackViewDataProfile.bottomAnchor.constraint(equalTo: containerViewProfile.bottomAnchor, constant: -10),
        ])
    }
    
    func setUpUI(){
        
        profileUsername.text = user.firstName + " " + user.lastName
        if let image = user.picture {
            profileImageView.setImageFromStringUrl(stringUrl: image)
        }
        profileEmail.text = user.email
        profileNumber.text = user.phone
        profileGender.text = user.gender
        if let location = user.location{
            profileCountry.text = location.country! + " _ " + location.city!
        }
      
    }
}

