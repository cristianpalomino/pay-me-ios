//
//  Card.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 2/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class Card {
    
    var type   = CardType.DEFAULT
    var image  :String!
    
    init(type :CardType, image :String) {
        self.type  = type
        self.image = image
    }
}
