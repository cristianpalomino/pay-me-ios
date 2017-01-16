//
//  PMSizes.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 3/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class SizesUtil {
    
    class func statusNavHeight(_ viewcontroller :UIViewController) -> CGFloat {
        return UIApplication.shared.statusBarFrame.height +
            viewcontroller.navigationController!.navigationBar.frame.height
    }
}
