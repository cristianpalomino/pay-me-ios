//
//  UIView.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 24/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    open var borderColor: UIColor {
        return UIColor(hexColor: "#ccd1d9")
    }
    
    func addBottomBorder() {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: frame.origin.x,
                              y: frame.height - 1,
                              width: UIScreen.main.bounds.width,
                              height: 1)
        borderLayer.backgroundColor = borderColor.cgColor
        layer.addSublayer(borderLayer)
    }
    
    func addCircleBorder() {
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = frame.height * 0.5
        layer.borderWidth = 1
    }
    
    func circle() {
        layer.cornerRadius = frame.height * 0.5
    }
}


