//
//  PMTabBarViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 14/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PMTabBarViewController {
    
    func customTabBar() {
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.isTranslucent = true
        self.tabBarController?.tabBar.backgroundColor = UIColor.clear
        self.tabBarController?.tabBar.barTintColor = UIColor.clear
    }
}
