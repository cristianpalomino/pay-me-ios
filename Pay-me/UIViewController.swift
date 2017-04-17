//
//  UtilViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func toSegue(identifier :String) {
        hideHUD()
        self.performSegue(withIdentifier: identifier, sender: nil)
    }
}

extension UITableViewController {

}

extension UIViewController {
    
    func addNavigationLogo(isGradient :Bool) {
        if isGradient {
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo-gradient"))
        } else {
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo"))
        }
    }
    
    @IBAction func tapBack() {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func tapClose() {
        self.resignFirstResponder()
        self.navigationController!.dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func blueTheme() {
        
    }
    
    func whiteTheme() {
        
    }
}
