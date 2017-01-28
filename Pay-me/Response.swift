//
//  Response.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Response {
    
    var answerCode      :String!
    var answerMessage   :String!
    
    init() {
        
    }
    
    init(json :JSON) {
        
        self.answerCode     = json[Constants.Api.Json.kAnswerCode].stringValue
        self.answerMessage  = json[Constants.Api.Json.kAnswerMessage].stringValue
    }
}

class PaymeError : Response {

    override init() {
        super.init()
        self.answerCode     = Constants.Api.kErrorCode
        self.answerMessage  = Constants.Api.Messages.kUnknownError
    }
    
    init(message: String) {
        super.init()
        self.answerCode     = Constants.Api.kErrorCode
        self.answerMessage  = message
    }
    
    override init(json :JSON) {
        super.init(json: json)
    }
}

class AgregarServicio : Response {
    
    var idCommerce      :String!
    var idCardholder    :String!
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
        self.idCardholder   = json[Constants.Api.Json.kIdCardholder].stringValue
    }
}
