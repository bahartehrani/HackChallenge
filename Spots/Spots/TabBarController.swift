//
//  TabBarController.swift
//  Spots
//
//  Created by Productivity on 11/18/19.
//  Copyright © 2019 Productivity. All rights reserved.
//

// https://stackoverflow.com/questions/23399066/how-to-change-uitabbar-image-dynamically-in-ios



import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let SSViewController = StudySpotsViewController()
        SSViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let DSSViewController = DetailedSpotViewController()
        DSSViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let FViewController = FavoritesViewController()
        FViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let tabBarList = [SSViewController, DSSViewController, FViewController]
        
        viewControllers = tabBarList
        
        
    }

}
