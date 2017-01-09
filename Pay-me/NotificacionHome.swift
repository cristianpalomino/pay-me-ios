//
//  NotificacionHome.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 06/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit

class NotificacionHome: NSObject {
    
    var messageTitle    :String!
    var messageBody     :String!
    
    init(data :[String]){
        self.messageTitle = data[0]
        self.messageBody = data[1]
    }
}
