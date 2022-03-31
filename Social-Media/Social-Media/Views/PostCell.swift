//
//  TVcellTableViewCell.swift
//  Social-Media
//
//  Created by MacBook on 08/07/1443 AH.
//

import UIKit

protocol PostCellDelegate {
    func userProfileTapped(cell:UITableViewCell)
}

class PostCell: UITableViewCell {
   
    
    var delegate :PostCellDelegate? = nil
    

    let contentbackView = ShadowView()
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
        btn.setTitle(" ", for: .normal)
//        btn.addTarget(self, action: #selector(likeCliked), for: .touchUpInside)
     return btn
    }()
    
    let likesLbl : UILabel = {
        let lbl = UILabel()
//        lbl.text = "5"
        lbl.translatesAutoresizingMaskIntoConstraints = false
     return lbl
    }()
    
    let username : UILabel = {
       let un = UILabel()
        
        un.textColor = .black
//        un.addTarget(self, action: #selector(profileCliked), for: .touchUpInside)
        un.translatesAutoresizingMaskIntoConstraints = false
        un.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        un.textAlignment = .left
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
//        image.addTarget(self, action: #selector(profileCliked), for: .touchUpInside)
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
//        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userStackViewTapped)))
//        image.image = UIImage(named: "unnamed")
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    
   
//        var view = UIView()
//        view.layer.shadowColor = UIColor.gray.cgColor
//        view.layer.shadowOpacity = 0.5 //مقدار شفافية الظل من ١-الي ٠
//        view.layer.shadowColor = UIColor.gray.cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 10)
//        view.layer.shadowRadius = 10   //مقدار تجمع الظل
//        view.layer.shadowOpacity = 0.7 //مقدار شفافية الظل من ١-الي ٠
//        view.layer.cornerRadius = 7
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()

    var userStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 5
        
//        stack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userStackViewTapped)))// عبارة عن كلاس يلاحظ اي حدث يحدث علي ستاك فيو وهو   الكلاس الكبير الذي يندرج تحته مجموعة الكلاسات ترث من UIGestureRecogniz وكل كلاس يمثل حدث معين .
        
//         الاكشن الي بسوي (تابد) ما راح اسويه مباشرة من uigesterReco بل من كلاس يرث من UIGesterReco يسمي ب UItapGesterReco
        return stack
    }()
    
   
    func addAction()  {
        userStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userStackViewTapped)))
    }
    
    
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
    
// MARK: ACTION

    @objc func userStackViewTapped(){
        delegate?.userProfileTapped(cell: self)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpView()

        self.backgroundColor = .white
        
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
        self.addSubview(contentbackView)
        self.addSubview(userImg)
        self.addSubview(username)
        self.addSubview(likesBtn)
        self.addSubview(likesLbl)
        contentbackView.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(postTextLbl)
        
        
//        self.addSubview(userStackView)
//        userStackView.addArrangedSubview(userImg)
//        userStackView.addArrangedSubview(username)
        
        self.addSubview(postStackView)
        self.addSubview(userStackView)
        userStackView.addArrangedSubview(userImg)
        userStackView.addArrangedSubview(username)
        postStackView.addArrangedSubview(postTextLbl)
        postStackView.addArrangedSubview(postImage)
    
        
        
        NSLayoutConstraint.activate([
            

            contentbackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contentbackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            contentbackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            contentbackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            postStackView.topAnchor.constraint(equalTo: username.topAnchor, constant: 70),
            postStackView.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 20),
            postStackView.rightAnchor.constraint(equalTo: contentbackView.rightAnchor, constant: -20),
            postStackView.bottomAnchor.constraint(equalTo: contentbackView.bottomAnchor, constant: -70),
            
            likesBtn.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 10),
            likesBtn.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 30),
            
            likesLbl.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 10),
            likesLbl.leftAnchor.constraint(equalTo: likesBtn.rightAnchor, constant: 10),

            userStackView.topAnchor.constraint(equalTo: contentbackView.topAnchor, constant: 15),
            userStackView.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 15),
//            userStackView.widthAnchor.constraint(equalTo: contentbackView.widthAnchor, constant: 5),
            userStackView.rightAnchor.constraint(equalTo: contentbackView.rightAnchor, constant: -90),
            userStackView.bottomAnchor.constraint(equalTo: contentbackView.bottomAnchor, constant: -330),

            
//            userImg.topAnchor.constraint(equalTo: contentbackView.topAnchor, constant: 15),
//            userImg.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 15),
//            userImg.rightAnchor.constraint(equalTo: contentbackView.rightAnchor, constant: -330),
//            userImg.bottomAnchor.constraint(equalTo: contentbackView.bottomAnchor, constant: -330),
//
//
//            username.topAnchor.constraint(equalTo: contentbackView.topAnchor, constant: 30),
//            username.leftAnchor.constraint(equalTo: userImg.rightAnchor, constant: 20),
//            username.widthAnchor.constraint(equalTo: contentbackView.widthAnchor, constant: 10),
            

            
            
        ])
        
    }
    
}

//
//            postTextLbl.topAnchor.constraint(equalTo: userStackView.topAnchor, constant: 50),
//            postTextLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
//            postTextLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),

//
//            postImage.topAnchor.constraint(equalTo: topAnchor,constant: 145),
//            postImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
//            postImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
//            postImage.heightAnchor.constraint(equalToConstant: 200),



//searching about how to use aspect Ratio Programming to make image as cyrcal shap 
