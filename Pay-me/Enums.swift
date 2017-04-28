//
//  Enums.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 2/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

enum CardType {
    
    case VALID
    case INVALID
    case ADD
    case DEFAULT
}

enum MessageType {
    
    case SUCCESS_PAY
    case NOT_AUTORIZED
    case INVALID_CARD
    case SERVICE_SAVED
}

enum FlowType {
    
    case FIRST_TIME
    case SECOND_TIME
}

enum PayType {
    
    case SUCCESS
    case DENIED
}

enum ServicesType :String {
    
    case BASICOS    = "Básicos"
    case SEGUROS    = "Seguro"
    case EDUCACION  = "Educación"
    case TRIBUTOS   = "Tributos"
}

enum ServiceStateType :String {
    
    case pendiente_verificacion = "1"
    case pendiente_pago         = "2"
    case pagado                 = "3"
    case cargos_recurrentes     = "4"
}


//Api

enum ResultType {
    
    case success
    case failure
}
