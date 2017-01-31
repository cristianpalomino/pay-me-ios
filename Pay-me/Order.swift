//
//  Order.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 31/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Order {
    
    var operationNumber     :String!
    var purchaseAmount      :String!
    var currencyCode        :String!
    var card                :String!
    var state               :String!
    var transactionDate     :String!
    var commerceName        :String!
    var products            = [Product]()
    
    init(json :JSON) {
        
        self.operationNumber    = json[Keys.kOperationNumber].stringValue
        self.purchaseAmount     = json[Keys.kPurchaseAmount].stringValue
        self.currencyCode       = json[Keys.kCurrencyCode].stringValue
        self.card               = json[Keys.kCard].stringValue
        self.state              = json[Keys.kState].stringValue
        self.transactionDate    = json[Keys.kTransactionDate].stringValue
        self.commerceName       = json[Keys.kCommerceName].stringValue
        
        if let jsona = json[Keys.kProducts].array {
            jsona.forEach{ products.append(Product(json: $0)) }
        }        
    }
}

extension Order {
    
    struct Keys {
        
        static let kOperationNumber     = "operationNumber"
        static let kPurchaseAmount      = "purchaseAmount"
        static let kCurrencyCode        = "currencyCode"
        static let kCard                = "card"
        static let kState               = "state"
        static let kTransactionDate     = "transactionDate"
        static let kCommerceName        = "commerceName"
        static let kProducts            = "products"
    }
}
