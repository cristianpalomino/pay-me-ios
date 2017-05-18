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

struct Debt: JSONObjectSerializable {
    
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
    
    init?(json: JSON) {
        guard
            let contador = json["contador"].string,
            let currency = json["currency"].string,
            let deudaTotal = json["deudaTotal"].string,
            let fechaEmision = json["fechaEmision"].string,
            let fechaOrden = json["fechaOrden"].string,
            let fechaVencimiento = json["fechaVencimiento"].string,
            let idD = json["idD"].string,
            let monto = json["monto"].string,
            let nameService = json["nameService"].string,
            let recibo = json["contador"].string
            else { return nil }
        
        self.contador = contador
        self.currency = currency
        self.deudaTotal = deudaTotal
        self.fechaEmision = fechaEmision
        self.fechaOrden = fechaOrden
        self.fechaVencimiento = fechaVencimiento
        self.idD = idD
        self.monto = monto
        self.nameService = nameService
        self.recibo = recibo
    }
}
