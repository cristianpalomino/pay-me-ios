//
//  Card.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 2/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import UIKit

enum CardState {
    case valid
    case invalid
}

enum CardType {
    case visa
    case marterard
    case cmr
    case amex
    case dinners
}

class Card {
    var type   = CardType.visa
    var status = CardState.valid
    var provider = ""
    var icon:UIImage?
    var name:String = ""
    var number:String = ""
    var cvc2:String = ""
    var month: String = ""
    var year:String = ""
    var expire:String = ""
    
    
    init(name:String
        , type :CardType)
    {
        self.name  = name
        self.type = type
        
    }
    
    convenience init (name:String
        ,number:String
        ,cvc2:String
        ,expire:String
        ,type :CardType)
    {
        self.init(name: name, type: type)
        self.number = number
        self.cvc2 = cvc2
        self.expire = expire
    }
}
