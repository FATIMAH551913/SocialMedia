//
//  TVcellTableViewCell.swift
//  Social-Media
//
//  Created by MacBook on 08/07/1443 AH.
//

import UIKit

class PostCell: UITableViewCell {
    

    
    let postTextLbl : UILabel = {
        let namelbl = UILabel()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        namelbl.textAlignment = .left
        namelbl.textColor = .black
        namelbl.numberOfLines = 0
//        namelbl.backgroundColor = .yellow
        return namelbl
    }()
    
    let likesBtn : UIButton = {
      let btn = UIButton()
        btn.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .blue
        btn.subtitleLabel?.text = "Like"
        btn.attributedTitle(for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 9, weight: .heavy)
        btn.titleLabel?.textAlignment = .center
        btn.setTitle("m", for: .normal)
//        btn.addTarget(self, action: #selector(likeCliked), for: .touchUpInside)
     return btn
    }()
    
    let likesLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "5"
        lbl.translatesAutoresizingMaskIntoConstraints = false

     return lbl
    }()
    
    let username : UILabel = {
       let un = UILabel()
        un.textColor = .black
//        un.text = "hi"
        un.translatesAutoresizingMaskIntoConstraints = false
        un.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        un.textAlignment = .left
//        un.backgroundColor = .green
        return un
    }()
    
    
    let postImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
//        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let userImg : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
//        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleToFill
        
        
        return image
    }()
    
    
//    let backView : UIView = {
//        var view = UIView()
////            didSet{
////                view.layer.shadowColor = UIColor.gray.cgColor
////                view.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
////       view.layer.shadowColor = UIColor.gray.cgColor
////        view.layer.shadowOffset = CGSize(width: 0, height: 10)
////        view.layer.shadowRadius = 10   //مقدار تجمع الظل
////                           view.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
////        view.layer.cornerRadius = 7
////
////            }
//
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//      return view
//    }()

//    let userStackView : UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.distribution = .fillProportionally
//        stack.spacing = 5
//        return stack
//    }()
    
   
//     let viw = UIView ()
//
//        viw.translatesAutoresizingMaskIntoConstraints = false
//        return viw
//    }()
    
    let postStackView : UIStackView = {

        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 10
        return stack
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    @objc func likeCliked (){
//        
//        
//        
//    }
    
   
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpView()
        
        contentView.addSubview(postStackView)
        contentView.addSubview(username)
        contentView.addSubview(userImg)
     
//        setUpBackView()
//        self.backgroundColor = .systemBrown
        
        
        
    }
    
    
//    func setUpBackView(){
//        self.addSubview(backView)
//        NSLayoutConstraint.activate([
//
//            backView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//            backView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
//            backView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
//            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//
//        ])
//
//
//    }
    func setUpView(){
    
//        self.addSubview(postImage)
        self.addSubview(userImg)
        self.addSubview(username)
        self.addSubview(likesBtn)
        self.addSubview(likesLbl)
//        self.addSubview(postTextLbl)
        
        
//        self.addSubview(userStackView)
//        userStackView.addArrangedSubview(userImg)
//        userStackView.addArrangedSubview(username)
        
        self.addSubview(postStackView)
        postStackView.addArrangedSubview(postTextLbl)
        postStackView.addArrangedSubview(postImage)
        
        
        
        NSLayoutConstraint.activate([
            
//
//            userStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
//            userStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
//            userStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
//            userStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -340),
            
            postStackView.topAnchor.constraint(equalTo: username.topAnchor, constant: 70),
            postStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            postStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            postStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            
            likesBtn.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 10),
            likesBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            
            likesLbl.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 10),
            likesLbl.leftAnchor.constraint(equalTo: likesBtn.rightAnchor, constant: 10),
            

            userImg.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            userImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            userImg.rightAnchor.constraint(equalTo: rightAnchor, constant: -330),
            userImg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -330),
            
//
//            postImage.topAnchor.constraint(equalTo: topAnchor,constant: 145),
//            postImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
//            postImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
//            postImage.heightAnchor.constraint(equalToConstant: 200),
            

            username.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            username.leftAnchor.constraint(equalTo: userImg.rightAnchor, constant: 20),
            username.widthAnchor.constraint(equalTo: widthAnchor, constant: 10),
            
//            
//            postTextLbl.topAnchor.constraint(equalTo: userStackView.topAnchor, constant: 50),
//            postTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
//            postTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            
        ])
        
    }
    
}






//searching about how to use aspect Ratio Programming to make image as cyrcal shap 
