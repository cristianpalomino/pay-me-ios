//
//  Debt.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 31/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

//"contador": "0",
//"currency": "604",
//"deudaTotal": "000000012500",
//"fechaEmision": "19122017",
//"fechaOrden": "0",
//"fechaVencimiento": "19112017",
//"idD": "183893",
//"idService": "53",
//"monto": "000000012500",
//"nameService": "MATRICULA           ",
//"recibo": "12345678        "

class Debt {
    
    var contador: String!
    var currency: String!
    var deudaTotal: String!
    var fechaEmision: String!
    var fechaOrden: String!
    var fechaVencimiento: String!
    var idD: String!
    var monto: String!
    var nameService: String!
    var recibo: String!
    
    init(json :JSON) {
        contador = json["contador"].stringValue
        currency = json["currency"].stringValue
        deudaTotal = json["deudaTotal"].stringValue
        fechaEmision = json["fechaEmision"].stringValue
        fechaOrden = json["fechaOrden"].stringValue
        fechaVencimiento = json["fechaVencimiento"].stringValue
        idD = json["idD"].stringValue
        monto = json["monto"].stringValue
        nameService = json["nameService"].stringValue
        recibo = json["contador"].stringValue
    }
}
