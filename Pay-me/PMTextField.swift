//
//  PMTextField.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 9/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import Material

class PMTextField: TextField {

}

extension PMTextField {
    
    func setPMTheme() {
        self.placeholderActiveColor = UIColor.lightGray
        self.placeholderNormalColor = UIColor.lightGray
        self.dividerActiveColor = UIColor.appGrayColor()
        self.dividerNormalColor = UIColor.appGrayColor()
        //self.dividerNormalHeight = 1
        //self.placeholderVerticalOffset = 10
    }
    
    func setPMThemeServiceConfiguration() {
        self.placeholderActiveColor = UIColor.lightGray
        self.placeholderNormalColor = UIColor.lightGray
        //self.dividerActiveColor = UIColor.appGrayColor()
        //self.dividerNormalColor = UIColor.appGrayColor()
        //self.dividerNormalHeight = 1
        //self.placeholderVerticalOffset = 5
    }
}
