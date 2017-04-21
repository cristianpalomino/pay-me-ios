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

class Debt {
    
    var codReference    :String!
    var amount          :String!
    var expirationDate  :String!
    var currency        :String!
    var location        :String!
    var payDocument     :String!
    var totalAmount     :String!
    var currencyName    :String!
    var emissionDate    :String!
    var nameService     :String!
    var idService       :String!
    
    init(json :JSON) {
        
        self.codReference       = json[Keys.kCodReference].stringValue
        self.amount             = json[Keys.kAmount].stringValue
        self.expirationDate     = json[Keys.kExpirationDate].stringValue
        self.currency           = json[Keys.kCurrency].stringValue
        self.location           = json[Keys.kLocation].stringValue
        self.payDocument        = json[Keys.kPayDocument].stringValue
        self.totalAmount        = json[Keys.kTotalAmount].stringValue
        self.currencyName       = json[Keys.kCurrencyName].stringValue
        self.emissionDate       = json[Keys.kEmissionDate].stringValue
        self.nameService        = json[Keys.kNameService].stringValue
        self.idService          = json[Keys.kIdService].stringValue
    }
}

extension Debt {
    
    struct Keys {
        
        static let kCodTrace             = "codTrace"
        static let kContador             = "contador"
        static let kCodReference         = "codReference"
        static let kAmount               = "amount"
        static let kExpirationDate       = "expirationDate"
        static let kCurrency             = "currency"
        static let kLocation             = "location"
        static let kPayDocument          = "payDocument"
        static let kTotalAmount          = "totalAmount"
        static let kCurrencyName         = "currencyName"
        static let kEmissionDate         = "emissionDate"
        static let kNameService          = "nameService"
        static let kIdService            = "idService"
    }
}
