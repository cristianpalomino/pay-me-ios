//
//  UtilViewController.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SVProgressHUD

extension UIViewController {
    
    func showHUD() {
        SVProgressHUD.show()
    }
    
    func hideHUD() {
        SVProgressHUD.dismiss()
    }
}

extension UIViewController {
    
    func toSegue(identifier :String) {
        self.hideHUD()
        self.performSegue(withIdentifier: identifier, sender: nil)
    }
}

extension UIViewController {
    
    func addNavigationLogo(isGradient :Bool) {
        if isGradient {
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo-gradient"))
        } else {
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "nav-logo"))
        }
    }
}

extension UIViewController {
    
    @IBAction func tapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapNotifications() {
        print("tapNotifications")
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
