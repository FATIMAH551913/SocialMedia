//
//  ViewController.swift
//  Social-Media
//
//  Created by MacBook on 01/09/1443 AH.
//

import UIKit

class RegisterVC: UIViewController {
// MARK: AS OUTLET
    let containerViewBackground = UIView ()
    let containerViewColor = UIView ()
    let nameTextField : UITextField = {
        $0.placeholder = "First Name"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let lastNameTextField : UITextField = {
        $0.placeholder = "Last Name"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let emailTextField : UITextField = {
        $0.placeholder = "E-mail"
        $0.isSecureTextEntry = true
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(UITextField())
    
    let signUpButton : UIButton = {
        $0.setTitle("Register", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 22.5
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
   
    let stackView : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    
    
    // MARK: LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
           setupUI()
        

    }
    
    @objc func signupAction() {
        UserAPI.RegesterNewUser(firstName: nameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!)  { user, errorMessage in
            if errorMessage != nil {
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(OkAction)
                    self.present (alert, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Succsess", message: "Uesr Created", preferredStyle: .alert)
                let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(OkAction)
                    self.present (alert, animated: true, completion: nil)
            }
        }
    }

}
extension RegisterVC {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
//        view.addSubview(containerViewBackground)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(emailTextField)
        containerViewBackground.translatesAutoresizingMaskIntoConstraints = false
        containerViewColor.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(signUpButton)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:200),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 210),
            
         
//
//
//
//                containerViewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                containerViewBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//                containerViewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
//                containerViewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//                containerViewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
        ])
    }
}

//        view.addSubview(containerViewBackground)
//        containerViewBackground.backgroundColor = .brown
//        containerViewBackground.addSubview(containerViewColor)
//        containerViewColor.backgroundColor = .red

//        containerViewBackground.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            containerViewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            containerViewBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            containerViewBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
//            containerViewBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//            containerViewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),

//            containerViewColor.bottomAnchor.constraint(equalTo: containerViewBackground.topAnchor,constant: 30),
//            containerViewColor.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//            containerViewColor.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
//            containerViewColor.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 15)
