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

class ResponseAgregarServicio : Response {
    
    var idCommerce      :String!
    var idCardholder    :String!
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
        self.idCardholder   = json[Constants.Api.Json.kIdCardholder].stringValue
    }
}

class ResponseConsultarServicios : Response {
    
    var idCommerce      :String!
    var idCardholder    :String!
    var services        = [Service]()
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
        self.idCardholder   = json[Constants.Api.Json.kIdCardholder].stringValue
        
        if let jsona = json[Constants.Api.Json.kServices].array {
            jsona.forEach{ services.append(Service(json: $0)) }
        }
    }
}

class ResponseConsultarPagos : Response {
    
    var orders  = [Order]()
    
    override init(json :JSON) {
        super.init(json: json)
        
        if let jsona = json[Constants.Api.Json.kOrder].array {
            jsona.forEach{ orders.append(Order(json: $0)) }
        }
    }
}

class ResponseConsultarAgenda : Response {
    
    var idCommerce      :String!
    var idCardholder    :String!
    var calendar        = [Calendar]()
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
        self.idCardholder   = json[Constants.Api.Json.kIdCardholder].stringValue
        
        if let jsona = json[Constants.Api.Json.kCalendar].array {
            jsona.forEach{ calendar.append(Calendar(json: $0)) }
        }
    }
}

class ResponseConsultarDeudas : Response {
    
    var idCommerce          :String!
    var serviceIdentifier   :String!
    var debts               = [Debt]()
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce         = json[Constants.Api.Json.kIdCommerce].stringValue
        self.serviceIdentifier  = json[Constants.Api.Json.kServiceIdentifier].stringValue
        
        if let jsona = json[Constants.Api.Json.kDebt].array {
            jsona.forEach{ debts.append(Debt(json: $0)) }
        }
    }
}

class ResponseConsultarNotificaciones : Response {
    
    var idCommerce      :String!
    var idCardholder    :String!
    var notificaciones  = [Notificacion]()
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
        self.idCardholder   = json[Constants.Api.Json.kIdCardholder].stringValue
        
        if let jsona = json[Constants.Api.Json.kNotification].array {
            jsona.forEach{ notificaciones.append(Notificacion(json: $0)) }
        }
    }
}

class ResponseEliminarNotificacion : Response {
    
    var idCommerce      :String!
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
    }
}

class ResponsePagarServicio : Response {
    
    var idCommerce      :String!
    var idCardholder    :String!
    var notificaciones  = [Notificacion]()
    
    override init(json :JSON) {
        super.init(json: json)
        
        self.idCommerce     = json[Constants.Api.Json.kIdCommerce].stringValue
        self.idCardholder   = json[Constants.Api.Json.kIdCardholder].stringValue
        
        if let jsona = json[Constants.Api.Json.kNotification].array {
            jsona.forEach{ notificaciones.append(Notificacion(json: $0)) }
        }
    }
}
