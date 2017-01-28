//
//  ServiciosParams.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class ServiciosParams {
    
    static let commonParams = ["idCardholder"  : Constants.Debug.ID_CARDHOLDER.encrypt(),
                               "idCommerce"    : Constants.Debug.ID_COMERCIO,
                               "macAddress"    : Constants.Debug.MAC_ADDRESS.encrypt()]
}
