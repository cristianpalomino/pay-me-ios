//
//  Calendar.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 31/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Calendar {
    
    var type    :CalendarType!
    var content :String!
    var date    :String!
    
    init(json :JSON) {
        
        self.content    = json[Keys.kContent].stringValue
        self.date       = json[Keys.kDate].stringValue
        
        switch json[Keys.kType].stringValue {
        case "1":
            self.type = CalendarType.EMISION_RECIBO
        case "2":
            self.type = CalendarType.FECHA_VENCIMIENTO
        case "3":
            self.type = CalendarType.RECORDATORIO_FECHA_VENCIMIENTO
        case "4":
            self.type = CalendarType.PAGO_RECURRENTE_EXITOSO
        case "5":
            self.type = CalendarType.VENCIMIENTO_TARJETA
        case "6":
            self.type = CalendarType.REGISTRO_DATOS_SEGURIDAD
        case "7":
            self.type = CalendarType.SERVICIO_PENDIENTE_CONFIRMADO
        case "8":
            self.type = CalendarType.SERVICIO_PENDIENTE_DESCARTADO
        default:
            self.type = CalendarType.NONE
        }
    }
}

extension Calendar {
    
    struct Keys {
        
        static let kType    = "type"
        static let kContent = "content"
        static let kDate    = "date"
    }
}

enum CalendarType :String {
    
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
