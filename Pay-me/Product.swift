//
//  Product.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 31/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Product {
    
    var item        :String!
    var code        :String!
    var name        :String!
    var unitPrice   :String!
    var quantity    :String!
    
    init(json :JSON) {
        
        self.item       = json[Keys.kItem].stringValue
        self.code       = json[Keys.kCode].stringValue
        self.name       = json[Keys.kName].stringValue
        self.unitPrice  = json[Keys.kUnitPrice].stringValue
        self.quantity   = json[Keys.kQuantity].stringValue
    }
}

extension Product {
    
    struct Keys {
        
        static let kItem        = "item"
        static let kCode        = "code"
        static let kName        = "name"
        static let kUnitPrice   = "unitPrice"
        static let kQuantity    = "quantity"
    }
}
