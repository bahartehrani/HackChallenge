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

        tabBar.barTintColor = UIColor(red: 27/255, green: 26/255, blue: 46/255, alpha: 1.0)
        tabBar.tintColor = UIColor(red: 183/255, green: 65/255, blue: 136/255, alpha: 1.0)
        tabBar.isTranslucent = false
        
        let SSViewController = StudySpotsViewController()
        SSViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "greyBook"), selectedImage: UIImage(named: "pinkBook"))
        
        let DSSViewController = DetailedSpotViewController()
        DSSViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "greyEvent"), selectedImage: UIImage(named: "pinkEvent"))
        
        let FViewController = FavoritesViewController()
        FViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "greyHeart"), selectedImage: UIImage(named: "pinkHeart"))
        
        let tabBarList = [SSViewController, DSSViewController, FViewController]
        
        viewControllers = tabBarList
    }

}
