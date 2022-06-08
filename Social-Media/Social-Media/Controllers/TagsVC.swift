//
//  TagsVC.swift
//  Social-Media
//
//  Created by MacBook on 10/10/1443 AH.
//

import UIKit
import NVActivityIndicatorView

class TagsVC: UIViewController {
    
    var tags:[String] = []
    
    let contentView = ShadowView()
    let loaderView = UIActivityIndicatorView()
    let headerview = UIView()
    let allTag : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lbl.text = "Tags"
        return lbl
    }()
    
    var collectionViewTag: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.register(TagCell.self, forCellWithReuseIdentifier:"TagCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemGray6
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            setUpUI()
        
        collectionViewTag.delegate = self
        collectionViewTag.dataSource = self
        
        loaderView.startAnimating()
        PostAPI.getAllTags { tags in
            self.loaderView.stopAnimating()
            self.tags = tags
            self.collectionViewTag.reloadData()
        }
    
        
        
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = view.bounds.size.width
        return CGSize(width: screenWidth/2.1, height: 100)
    }

}

extension TagsVC : UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        let currentTag = tags[indexPath.row]
        cell.tagNameLbl.text = currentTag
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTag = tags[indexPath.row]
        let vc = PostsVC()
        vc.tag = selectedTag
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension TagsVC {
    func setUpUI(){
        view.addSubview(collectionViewTag)
        view.addSubview(headerview)
        view.addSubview(allTag)
        view.addSubview(loaderView)
        
        headerview.backgroundColor = .systemPurple
        loaderView.color = .blue

        headerview.translatesAutoresizingMaskIntoConstraints = false
        allTag.translatesAutoresizingMaskIntoConstraints = false
        loaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerview.topAnchor.constraint(equalTo: view.topAnchor),
            headerview.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerview.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerview.bottomAnchor.constraint(equalTo: collectionViewTag.topAnchor),
            
            collectionViewTag.topAnchor.constraint(equalTo:view.topAnchor, constant: 200),
            collectionViewTag.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 5),
            collectionViewTag.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -5),
            collectionViewTag.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionViewTag.widthAnchor.constraint(equalToConstant: view.bounds.size.width-20),

            allTag.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            allTag.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 120),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 120),
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            ])
        
    }
    
}

