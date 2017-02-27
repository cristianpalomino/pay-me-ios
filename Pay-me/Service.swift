
//
//  Service.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Service {
    
    var idCompanySPS        :String!
    var idServiceSPS        :String!
    var idService           :String!
    var serviceIdentifier   :String!
    var owner               :String!
    var alias               :String!
    var codeService         :String!
    var amount              :String!
    var state               :ServiceStateType!
    
    init(json :JSON) {
        
        self.idCompanySPS       = json[Keys.kIdCompanySPS].stringValue
        self.idServiceSPS       = json[Keys.kIdServiceSPS].stringValue
        self.idService          = json[Keys.kIdService].stringValue
        self.serviceIdentifier  = json[Keys.kServiceIdentifier].stringValue
        self.owner              = json[Keys.kOwner].stringValue
        self.alias              = json[Keys.kAlias].stringValue
        self.codeService        = json[Keys.kCodeService].stringValue
        self.amount             = json[Keys.kAmount].stringValue
     
        guard let istate = Int(json[Keys.kState].stringValue) else {
            return
        }
        self.state  = ServiceStateType(rawValue: istate)
    }
}

extension Service {
    
    struct Keys {

        static let kIdCompanySPS        = "IdCompanySPS"
        static let kIdServiceSPS        = "idServiceSPS"
        static let kIdService           = "idService"
        static let kServiceIdentifier   = "serviceIdentifier"
        static let kOwner               = "owner"
        static let kAlias               = "alias"
        static let kAmount              = "amount"
        static let kCodeService         = "codeService"
        static let kState               = "state"
    }
}
