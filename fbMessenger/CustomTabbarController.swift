//
//  CustomTabbarController.swift
//  fbMessenger
//
//  Created by GVN on 6/20/18.
//  Copyright © 2018 Son Vu. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set bar
        let layout = UICollectionViewFlowLayout()
        let friendsController = FriendsController(collectionViewLayout: layout)
        let recentMessNaviController = UINavigationController(rootViewController: friendsController)
        recentMessNaviController.tabBarItem.title = "Recent"
        recentMessNaviController.tabBarItem.image = UIImage(named: "recent")
        
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = "Calls"
        navController.tabBarItem.image = UIImage(named: "calls")
        
        let viewController1 = UIViewController()
        let navController1 = UINavigationController(rootViewController: viewController1)
        navController1.tabBarItem.title = "Group"
        navController1.tabBarItem.image = UIImage(named: "groups")
        
        let viewController2 = UIViewController()
        let navController2 = UINavigationController(rootViewController: viewController2)
        navController2.tabBarItem.title = "People"
        navController2.tabBarItem.image = UIImage(named: "people")
        
        let viewController3 = UIViewController()
        let navController3 = UINavigationController(rootViewController: viewController3)
        navController3.tabBarItem.title = "Settings"
        navController3.tabBarItem.image = UIImage(named: "settings")
        
        viewControllers = [recentMessNaviController, navController, navController1, navController2, navController3]
    }
    
    
}
