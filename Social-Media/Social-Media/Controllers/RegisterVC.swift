//
//  ViewController.swift
//  Social-Media
//
//  Created by MacBook on 01/09/1443 AH.
//

import UIKit
import Spring

class RegisterVC: UIViewController {
// MARK: AS OUTLET
    let containerViewBackground = UIView ()
    let containerViewColor = UIView ()
 


    let nameTextField : SpringTextField = {
        $0.placeholder = "First Name"
        $0.delay = 1
        $0.animation = "fadeInLeft"
        $0.duration = 0.5
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(SpringTextField())
    
    let lastNameTextField : SpringTextField = {
        $0.placeholder = "Last Name"
        $0.delay = 1
        $0.animation = "fadeInLeft"
        $0.duration = 0.9
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(SpringTextField ())
    
    let emailTextField : SpringTextField = {
        $0.placeholder = "E-mail"
        $0.delay = 1
        $0.animation = "fadeInLeft"
        $0.duration = 1
        $0.isSecureTextEntry = true
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 22.5
        return $0
    }(SpringTextField())
    
    let signUpButton : SpringButton = {
        $0.setTitle("Register", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemPurple
        $0.layer.cornerRadius = 22.5
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        return $0
    }(SpringButton(type: .system))
   
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
           animatIn()
       
    }
    
    func animatIn(){
        
        nameTextField.animate()
        lastNameTextField.animate()
        emailTextField.animate()
        signUpButton.animate()
    
    }
    
    @objc func registerButtonClicked() {
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
            
        ])
    }
}
