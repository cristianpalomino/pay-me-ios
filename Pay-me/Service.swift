
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
    var serviceIdentifier   :String?
    var owner               :String!
    var alias               :String?
    var inSPR               :String!
    var amount              :String?
    var state               :ServiceStateType!
    
    init(json :JSON) {
        
        self.idCompanySPS       = json[Keys.kIdCompanySPS].stringValue
        self.idServiceSPS       = json[Keys.kIdServiceSPS].stringValue
        self.idService          = json[Keys.kIdService].stringValue
        self.serviceIdentifier  = json[Keys.kServiceIdentifier].string
        self.owner              = json[Keys.kOwner].stringValue
        self.alias              = json[Keys.kAlias].string
        self.inSPR              = json[Keys.kInSPR].stringValue
        self.amount             = json[Keys.kAmount].string
     
        guard let istate = Int(json[Keys.kState].stringValue) else {
            return
        }
        self.state  = ServiceStateType(rawValue: istate)
    }
}

extension Service {
    
    struct Keys {

        static let kIdCompanySPS        = "idCompanySPS"
        static let kIdServiceSPS        = "idServiceSps"
        static let kIdService           = "idService"
        static let kServiceIdentifier   = "serviceIdentifier"
        static let kOwner               = "owner"
        static let kAlias               = "alias"
        static let kAmount              = "amount"
        static let kInSPR               = "inSPR"
        static let kState               = "state"
    }
    
    func toParams() -> [String : Any] {
        var params :[String : Any] = [:]
        params[Keys.kIdCompanySPS] = self.idCompanySPS
        params[Keys.kIdServiceSPS] = self.idServiceSPS
        params[Keys.kServiceIdentifier] = self.serviceIdentifier
        params[Keys.kOwner] = self.owner
        return params
    }
}

extension Service: Hashable {
    
    var hashValue: Int {
        return idService.hashValue
    }
    
    static func == (lhs: Service, rhs: Service) -> Bool {
        return lhs.idService == rhs.idService
    }
}
