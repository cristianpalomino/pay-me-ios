//
//  Notificacion.swift
//  Pay-me
//
//  Created by Alignet Desarrollo on 26/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import UIKit
import SwiftyJSON

class Notificacion {
    
    var image   :String!
    var name    :String!
    var message :String!
    var code    :String!
    var etiqueta :String!
    var monto   :String!
    
    var idNotification  :String!
    var type            :NotificacionType!
    var content         :String!
    
    init(data :[String]) {
        self.image = data[0]
        self.name = data[1]
        self.message = data[2]
        self.code = data[3]
        self.etiqueta = data[4]
        self.monto = data[5]
    }
    
    init(json :JSON) {
        
        self.idNotification = json[Keys.kIdNotification].stringValue
        self.content        = json[Keys.kContent].stringValue
        
        switch json[Keys.kType].stringValue {
        case "1":
            self.type = NotificacionType.EMISION_RECIBO
        case "2":
            self.type = NotificacionType.FECHA_VENCIMIENTO
        case "3":
            self.type = NotificacionType.RECORDATORIO_FECHA_VENCIMIENTO
        case "4":
            self.type = NotificacionType.PAGO_RECURRENTE_EXITOSO
        case "5":
            self.type = NotificacionType.VENCIMIENTO_TARJETA
        case "6":
            self.type = NotificacionType.REGISTRO_DATOS_SEGURIDAD
        case "7":
            self.type = NotificacionType.SERVICIO_PENDIENTE_CONFIRMADO
        case "8":
            self.type = NotificacionType.SERVICIO_PENDIENTE_DESCARTADO
        default:
            self.type = NotificacionType.NONE
        }
    }
}

extension Notificacion {
    
    struct Keys {
        
        static let kIdNotification  = "idNotification"
        static let kType            = "type"
        static let kContent         = "content"
    }
}

enum NotificacionType :String {
    
    case EMISION_RECIBO                 = "1"
    case FECHA_VENCIMIENTO              = "2"
    case RECORDATORIO_FECHA_VENCIMIENTO = "3"
    case PAGO_RECURRENTE_EXITOSO        = "4"
    case VENCIMIENTO_TARJETA            = "5"
    case REGISTRO_DATOS_SEGURIDAD       = "6"
    case SERVICIO_PENDIENTE_CONFIRMADO  = "7"
    case SERVICIO_PENDIENTE_DESCARTADO  = "8"
    case NONE                           = "-1"
}
