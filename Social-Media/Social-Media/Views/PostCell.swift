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
   
    var tags : [String] = []
    var delegate :PostCellDelegate? = nil
    

    
    let contentbackView = ShadowView()
    let postTextLbl : UILabel = {
        let namelbl = UILabel()
        namelbl.translatesAutoresizingMaskIntoConstraints = false
        namelbl.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        namelbl.textAlignment = .left
        namelbl.textColor = .black
        namelbl.numberOfLines = 0
        return namelbl
    }()
    
    let TagscollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.register(PostTagCell.self, forCellWithReuseIdentifier:"PostTagCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
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
     return btn
    }()
    
    let likesLbl : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
     return lbl
    }()
    
    let username : UILabel = {
       let un = UILabel()
        un.textColor = .black
        un.translatesAutoresizingMaskIntoConstraints = false
        un.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        un.textAlignment = .left
        return un
    }()
    
    
    let postImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    let userImg : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .center
        return image
    }()
    
    var contentUserSV = ShadowView()
    var userStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 5
    return stack
    }()
    
    let postStackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 10
        return stack
    }()
    
   
    func addAction()  {
        contentUserSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userStackViewTapped)))
    }
    
    func didSet(){
        TagscollectionView.delegate = self
        TagscollectionView.dataSource = self
    }
    
    

    
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
    
    func setUpView(){
    
        self.addSubview(contentbackView)
        self.addSubview(likesBtn)
        self.addSubview(TagscollectionView)
        self.addSubview(likesLbl)
        contentbackView.translatesAutoresizingMaskIntoConstraints = false
        contentUserSV.translatesAutoresizingMaskIntoConstraints = false
        contentbackView.addSubview(contentUserSV)
        contentbackView.addSubview(postStackView)
        contentUserSV.addSubview(userImg)
        contentUserSV.addSubview(username)
        postStackView.addArrangedSubview(postTextLbl)
        postStackView.addArrangedSubview(postImage)
       
        
        NSLayoutConstraint.activate([
            contentbackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contentbackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            contentbackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            contentbackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            contentUserSV.topAnchor.constraint(equalTo: contentbackView.topAnchor, constant: 20),
            contentUserSV.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 15),
            contentUserSV.rightAnchor.constraint(equalTo: contentbackView.rightAnchor, constant: -15),
            contentUserSV.heightAnchor.constraint(equalToConstant: 60),
            
            userImg.topAnchor.constraint(equalTo: contentUserSV.topAnchor, constant: 9),
            userImg.leftAnchor.constraint(equalTo: contentUserSV.leftAnchor, constant: 12),
            userImg.rightAnchor.constraint(equalTo: contentUserSV.rightAnchor, constant: -290),
            userImg.bottomAnchor.constraint(equalTo: contentUserSV.bottomAnchor, constant: -9),

            username.topAnchor.constraint(equalTo: contentUserSV.topAnchor, constant: 18),
            username.leftAnchor.constraint(equalTo: userImg.rightAnchor, constant: 20),
            username.widthAnchor.constraint(equalTo: contentUserSV.widthAnchor, constant: 10),

            postStackView.topAnchor.constraint(equalTo: contentUserSV.bottomAnchor, constant: 30),
            postStackView.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 20),
            postStackView.rightAnchor.constraint(equalTo: contentbackView.rightAnchor, constant: -20),
            postStackView.heightAnchor.constraint(equalToConstant:300),

            TagscollectionView.topAnchor.constraint(equalTo: postStackView.bottomAnchor, constant: 10),
            TagscollectionView.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 20),
            TagscollectionView.rightAnchor.constraint(equalTo: contentbackView.rightAnchor, constant: -20),
            TagscollectionView.heightAnchor.constraint(equalToConstant: 50),

            likesBtn.topAnchor.constraint(equalTo: TagscollectionView.bottomAnchor, constant: 10),
            likesBtn.leftAnchor.constraint(equalTo: contentbackView.leftAnchor, constant: 30),

            likesLbl.topAnchor.constraint(equalTo: TagscollectionView.bottomAnchor, constant: 10),
            likesLbl.leftAnchor.constraint(equalTo: likesBtn.rightAnchor, constant: 10),

        ])
        
    }
    
}

//searching about how to use aspect Ratio Programming to make image as cyrcal shap 
extension PostCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostTagCell", for: indexPath) as! PostTagCell
        cell.tagNameLbl.text = tags[indexPath.row]
    
        return cell
    }
}
    

extension PostCell: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = self.bounds.size.width
            return CGSize(width: screenWidth/2.4, height: 35)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
            
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
    
    }
