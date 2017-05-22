//
//  UIButton.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 24/04/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.bounds
        updatedFrame.size.height += 20
        gradientLayer.frame = updatedFrame
        gradientLayer.colors =
            [UIColor(hexColor: "#FF00AB").cgColor, //(hex: "FF00a8").cgColor,
            UIColor(hexColor: "#8140d4").cgColor,
            UIColor(hexColor: "#0083FF").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(image, for: UIControlState.normal)
    }
}


