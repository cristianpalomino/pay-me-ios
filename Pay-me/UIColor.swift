//
//  UIColor.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 24/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexColor hex: String) {
        
        let alpha: Float = 100
        let hexLength = hex.characters.count
        if !(hexLength == 7 || hexLength == 9) {
            self.init(white: 0, alpha: 1)
            return
        }
        
        // Establishing the rgb color
        var rgb: UInt32 = 0
        let s: Scanner = Scanner(string: hex)
        // Setting the scan location to ignore the leading `#`
        s.scanLocation = 1
        // Scanning the int into the rgb colors
        s.scanHexInt32(&rgb)
        // Creating the UIColor from hex int
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha / 100)
        )
    }
}
