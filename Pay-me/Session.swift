//
//  Session.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 2/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class Session {
    
    var current    = Current()
    var staticData = Static()
    
    var flowType    = FlowType.SECOND_TIME
    var messageType = MessageType.INVALID_CARD
    
    static let sharedInstance = Session()
    fileprivate init() {}
}

struct Current {
    
    var servicioGeneral :ServicioGeneral?
}
