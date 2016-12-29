//
//  Notificacion.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class Notificacion: NSObject {
    
    var image   :String!
    var name    :String!
    var message :String!
    var code    :String!
    var etiqueta :String!
    var monto   :String!
    
    init(data :[String]) {
        self.image = data[0]
        self.name = data[1]
        self.message = data[2]
        self.code = data[3]
        self.etiqueta = data[4]
        self.monto = data[5]
    }
}
