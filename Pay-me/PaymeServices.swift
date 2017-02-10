//
//  PaymeServices.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 4/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class PaymeServices {
    
    let serviciosServices   = ServiciosServices()
    
    static let sharedInstance = PaymeServices()
    fileprivate init() {}
}
