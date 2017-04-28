
//
//  Service.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
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

// Service
//"debts": {
//    "contador": "0",
//    "currency": "604",
//    "deudaTotal": "000000012500",
//    "fechaEmision": "19122017",
//    "fechaOrden": "0",
//    "fechaVencimiento": "19112017",
//    "idD": "183893",
//    "idService": "53",
//    "monto": "000000012500",
//    "nameService": "MATRICULA           ",
//    "recibo": "12345678        "
//},
//"idService": "53",
//"nameService": "MATRICULA           "

class Favorito {
    
    var alias: String!
    var amount: String!
    var idCompanySPS: String!
    var idService: String!
    var idServiceSPS: String!
    var inSPR: String!
    var owner: String!
    var serviceIdentifier: String!
    var state: ServiceStateType!
    
    init(json :JSON) {
        
        alias = json["alias"].stringValue
        amount = json["amount"].stringValue
        idCompanySPS = json["idCompanySPS"].stringValue
        idService = json["idService"].stringValue
        idServiceSPS = json["idServiceSPS"].stringValue
        inSPR = json["inSPR"].stringValue
        owner = json["owner"].stringValue
        serviceIdentifier = json["serviceIdentifier"].stringValue
        state = ServiceStateType(rawValue: json["state"].stringValue)
    }
}

extension Favorito {
    
    func toParams() -> [String : Any] {
        var params :[String : Any] = [:]
        params["idCompanySPS"] = self.idCompanySPS
        params["idServiceSPS"] = self.idServiceSPS
        params["serviceIdentifier"] = self.serviceIdentifier
        params["owner"] = self.owner
        return params
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

class Service {

    var nameService: String
    var idService: String
    var debts = [Debt]()
    
    init(json :JSON) {
        
        nameService = json["nameService"].stringValue
        idService = json["idService"].stringValue
        json["debts"].arrayValue.map{ debts.append(Debt(json: $0)) }
    }
}
