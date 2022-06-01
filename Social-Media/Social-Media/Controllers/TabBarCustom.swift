//
//  TabBar.swift
//  Social-Media
//
//  Created by MacBook on 10/10/1443 AH.
//

import UIKit

class TabBarCustom: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            
            barItem(tabBarTitle: "Profile", tabBarImage: UIImage(systemName: "person.fill")!.withTintColor(UIColor(named: "TextColor")!, renderingMode: .alwaysOriginal), viewController: PrfilePersonalVC()),
            
            barItem(tabBarTitle: "Tags", tabBarImage: UIImage(systemName: "tag")!.withTintColor(UIColor(named: "TextColor")!, renderingMode: .alwaysOriginal), viewController: TagsVC()),
            
            barItem(tabBarTitle: "Posts", tabBarImage: UIImage(systemName: "homekit")!.withTintColor(UIColor(named: "TextColor")!, renderingMode: .alwaysOriginal), viewController: PostsVC()),
        
            barItem(tabBarTitle: "Add", tabBarImage: UIImage(systemName: "cross.circle.fill")!.withTintColor(UIColor(named: "TextColor")!, renderingMode: .alwaysOriginal), viewController: NewPostVC()),
        ]
        
        tabBar.backgroundColor = .systemBrown
        tabBar.isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        selectedIndex = 1
    }
    
    private func barItem(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.tabBarItem.title = tabBarTitle
        navCont.tabBarItem.image = tabBarImage
        return navCont
    }
    
}

