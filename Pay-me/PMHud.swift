//
//  PMHud.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 8/02/17.
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
