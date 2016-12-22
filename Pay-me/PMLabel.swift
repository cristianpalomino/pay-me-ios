//
//  PMLabel.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 21/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

@IBDesignable
class PMLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}
