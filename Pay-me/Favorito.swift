//
//  Favorito.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 24/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class Favorito: NSObject {

    var image   :String!
    var name    :String!
    var entidad :String!
    var code    :String!
    var etiqueta :String!
    var monto   :String!
    
    init(data :[String]) {
        self.image = data[0]
        self.name = data[1]
        self.entidad = data[2]
        self.code = data[3]
        self.etiqueta = data[4]
        self.monto = data[5]
    }
}
