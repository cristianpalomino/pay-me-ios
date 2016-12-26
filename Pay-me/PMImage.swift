//
//  PMImage.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 24/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets:
            UIEdgeInsets(top: insetDimen,
                         left: insetDimen,
                         bottom: insetDimen,
                         right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom),
            false,
            self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
}
