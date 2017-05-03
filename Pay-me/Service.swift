
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
//"idService": "53",
//"nameService": "MATRICULA           "

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
