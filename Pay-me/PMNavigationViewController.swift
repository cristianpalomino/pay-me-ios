//
//  PMNavigationViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 15/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class PMNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationLogo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController {

    func addNavigationLogo() {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo"))
    }
    
    @IBAction func tapBack() {
        self.navigationController!.popViewController(animated: true)
    }
}
