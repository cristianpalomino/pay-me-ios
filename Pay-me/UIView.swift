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
    
    enum ViewSide {
        
        case left, right, top, bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: UIColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .left:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .right:
            border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .top:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .bottom:
            border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.masksToBounds = true
        layer.addSublayer(border)
    }
    
    open var borderColor: UIColor {
        return UIColor(hexColor: "#AAB2BD")
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
}
