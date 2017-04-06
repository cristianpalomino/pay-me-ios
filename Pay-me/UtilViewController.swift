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
