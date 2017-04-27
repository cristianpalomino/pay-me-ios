//
//  UITableViewCell.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 27/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import  UIKit

extension UITableViewCell {
    
    
    func customSelection() {
        
        let view = UIView()
        view.backgroundColor = UIColor(hexColor: "#F5F7FA")
        selectedBackgroundView = view
    }
}
