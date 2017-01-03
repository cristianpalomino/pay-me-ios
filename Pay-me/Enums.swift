//
//  Enums.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 2/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

enum CardType {
    
    case VALID
    case INVALID
    case ADD
    case DEFAULT
}

enum MessageType {
    
    case SUCCESS_PAY
    case NOT_AUTORIZED
    case INVALID_CARD
    case SERVICE_SAVED
}
