//
//  DSVCExtension.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 1/03/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension DetalleSuministroViewController {
    
    @IBAction func tapButton() {
        if hasManyServices {
            self.toSegue(identifier: Constants.Storyboard.Segues.kListServices)
        } else {
            self.callAddServices()
        }
    }
}
