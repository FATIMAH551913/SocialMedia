//
//  LogInVC.swift
//  Social-Media
//
//  Created by MacBook on 04/09/1443 AH.
//

import UIKit

class SignInVC: UIViewController {
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
 
    
    let signUpButton : UIButton = {
        $0.setTitle("Sign in", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 22.5
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    let loginButton : UIButton = {
        $0.setTitle("Do't have an account? register", for: .normal)
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 22.5
        $0.tintColor = .blue
        $0.addTarget(self, action: #selector(clickedCreatAccount), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    
    let skipButton : UIButton = {
        $0.setTitle("SKip", for: .normal)
        $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        $0.backgroundColor = .darkText
        $0.layer.cornerRadius = 22.5
//        $0.tintColor = .black
        $0.tintColor = .blue
        $0.addTarget(self, action: #selector(skipedTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
   
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
        
//        self.nameTextField.text = "Sara"
//        self.lastNameTextField.text = "Andersen"
        self.nameTextField.text = "Fatimah"
        self.lastNameTextField.text = "Ayeidh"

        
    }
    
    @objc func clickedCreatAccount(){
        navigationController?.pushViewController(RegisterVC(), animated: true)

//        navigationController?.dismiss(RegisterVC(), animated: true, completion: nil)
    }
    
    @objc func signupAction() {
        UserAPI.SignInUser(firstName: nameTextField.text!, lastName: lastNameTextField.text!) { user, erorrMessage in
            if let message =  erorrMessage {
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                if let loggedInUser = user{
                    let vc = TabBarCustom()
                    UserManager.loggedInUser = loggedInUser
                    let nav = UINavigationController()
                    nav.viewControllers = [vc]
                    nav.modalPresentationStyle = .fullScreen
                    nav.modalTransitionStyle = .flipHorizontal
                    self.present(nav, animated: true, completion: nil)
                }
            }
        }
    }
    @objc func skipedTapped(){
        
        let vc = TabBarCustom()
        let nav = UINavigationController()
        nav.viewControllers = [vc]
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .flipHorizontal
        self.present(nav, animated: true, completion: nil)
        
    }
}
extension SignInVC {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(skipButton)
        view.addSubview(stackView)
//        view.addSubview(containerViewBackground)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(loginButton)
       
       
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        containerViewBackground.translatesAutoresizingMaskIntoConstraints = false
        containerViewColor.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
       
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:200),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 210),
            
            skipButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 150),
            skipButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            skipButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
            ])
            
            }
        }
