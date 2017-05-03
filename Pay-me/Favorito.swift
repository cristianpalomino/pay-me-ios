//
//  Favorito.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 02/05/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import SwiftyJSON

// Favorito
//"alias": "Pension",
//"amount": "000000012170",
//"idCompanySPS": "50",
//"idService": "281",
//"idServiceSps": "53",
//"inSPR": "null",
//"owner": "Juan Diego",
//"serviceIdentifier": "123",
//"state": "2"

struct Favorito: ResponseObjectSerializable, ResponseCollectionSerializable {
    
    var alias: String?
    var amount: String?
    var idCompanySPS: String
    var idService: String
    var idServiceSPS: String
    var inSPR: String
    var owner: String
    var serviceIdentifier: String
    var state: ServiceStateType
    
    init?(response: HTTPURLResponse, json: JSON) {
        
        guard
            let alias = json["alias"].string,
            let amount = json["amount"].string,
            let idCompanySPS = json["idCompanySPS"].string,
            let idService = json["idService"].string,
            let idServiceSPS = json["idServiceSPS"].string,
            let inSPR = json["inSPR"].string,
            let owner = json["owner"].string,
            let serviceIdentifier = json["serviceIdentifier"].string,
            let state = ServiceStateType(rawValue: json["state"].string ?? "1")
            else { return nil }
        
        self.alias = alias
        self.amount = amount
        self.idCompanySPS = idCompanySPS
        self.idService = idService
        self.idServiceSPS = idServiceSPS
        self.inSPR = inSPR
        self.owner = owner
        self.serviceIdentifier = serviceIdentifier
        self.state = state
    }
}

extension Favorito: Hashable {
    
    var hashValue: Int {
        return idService.hashValue
    }
    
    static func == (lhs: Favorito, rhs: Favorito) -> Bool {
        return lhs.idService == rhs.idService
    }
}
