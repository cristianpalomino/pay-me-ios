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
        self.view.isUserInteractionEnabled = false
        SVProgressHUD.show()
    }
    
    func hideHUD() {
        self.view.isUserInteractionEnabled = true
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
    
    func blueTheme() {
        
    }
    
    func whiteTheme() {
        
    }
}

extension UIViewController {
    
    func touchView() {
        self.dismiss(animated: true, completion: nil)
    }
}
