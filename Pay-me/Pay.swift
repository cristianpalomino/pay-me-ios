//
//  Pay.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 9/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class Pay: NSObject {

    var name        :String!
    var entidad     :String!
    var identifier  :String!
    var total       :String!
    var fecha       :String!
    var hora        :String!
    var type        :PayType = .SUCCESS
    
    init(name :String, entidad :String, identifier :String, type :PayType) {
        self.name = name
        self.entidad = entidad
        self.identifier = identifier
        self.type = type
        
        self.total = "S/ 1,123.18"
        self.fecha = "23\nDic"
        self.hora = "00:00"
    }
}

extension Pay {
    
    func getColor() -> UIColor {
        switch type {
        case .SUCCESS:
            return UIColor.appGreenHistoricoColor()
        case .DENIED:
            return UIColor.appRedHistoricoColor()
        }
    }
}
