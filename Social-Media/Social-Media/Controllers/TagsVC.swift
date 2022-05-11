//
//  TagsVC.swift
//  Social-Media
//
//  Created by MacBook on 10/10/1443 AH.
//

import UIKit

class TagsVC: UIViewController {
    
    var tags = [ "k" , "m", "b","k" , "m", "b","k" , "m", "b"
    ]
    
//    let contentView = UIView()
    let headerview = UIView()
    let allTag : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lbl.text = "Tags"
        return lbl
    }()
    
    
    var collectionViewTag: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.register(TagCell.self, forCellWithReuseIdentifier:"TagCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
    
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionViewTag.delegate = self
        collectionViewTag.dataSource = self
    
        
        view.addSubview(collectionViewTag)
        view.addSubview(headerview)
        view.addSubview(allTag)
//        contentView.addSubview(collectionViewTag)
        
        headerview.backgroundColor = .systemBrown
//        contentView.backgroundColor = .yellow
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        allTag.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            headerview.topAnchor.constraint(equalTo: view.topAnchor),
            headerview.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerview.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerview.bottomAnchor.constraint(equalTo: collectionViewTag.topAnchor),
            
            collectionViewTag.topAnchor.constraint(equalTo:view.topAnchor, constant: 200),
            collectionViewTag.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionViewTag.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionViewTag.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            allTag.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            allTag.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
        
//                contentView.rightAnchor.constraint(equalTo: collectionViewTag.rightAnchor,constant: -8),
//                contentView.leftAnchor.constraint(equalTo: collectionViewTag.leftAnchor,constant: 8),
//                contentView.topAnchor.constraint(equalTo: collectionViewTag.topAnchor,constant: 10),
//                contentView.bottomAnchor.constraint(equalTo: collectionViewTag.bottomAnchor,constant: -10)
            ])
            
    }
    

}

extension TagsVC : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        let currentTag = tags[indexPath.row]
        cell.tagNameLbl.text = currentTag
        return cell
        
        
    }
    
}

