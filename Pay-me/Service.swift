
//
//  Service.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

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
//"idServiceSPS": "53",
//"nameService": "MATRICULA           "

class Service: JSONObjectSerializable {

    var nameService: String
    var idService: String
    var debts = [Debt]()
    
    required init?(json: JSON) {
        
        guard
            let nameService = json["nameService"].string,
            let idService = json["idServiceSPS"].string
            else { return nil }
        
        self.nameService = nameService
        self.idService = idService
        
        guard let array = json["debts"].array else {
            if let debt = Debt(json: json["debts"]) {
                debts.append(debt)
            } else {
                return nil
            }
            return
        }
        
        array.forEach {
            if let debt = Debt(json: $0) {
                debts.append(debt)
            }
        }
    }
}
