//
//  Constants.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 29/12/16.
//  Copyright © 2016 Cristian Palomino Rivera. All rights reserved.
//

import Foundation


struct Constants {

    struct Debug {
        
        static let ID_CARDHOLDER = "4626"
        static let MAC_ADDRESS   = "10:0b:95:9d:68:20"
        static let ID_COMERCIO   = "919"
    }
    
    struct Api {
        
        static let kErrorCode    = "999"
        static let kSuccessCode  = "000"
        
        struct Messages {
            
            static let kUnknownError        = "Error desconosido ...!"
        }
        
        struct Json {
            
            static let kAnswerCode          = "answerCode"
            static let kAnswerMessage       = "answerMessage"
            
            static let kIdCardholder        = "idCardholder"
            static let kIdCommerce          = "idCommerce"
            static let kMacAddress          = "macAddress"
            
            static let kServices            = "services"
            static let kOrder               = "order"
            static let kCalendar            = "Calendar"
            static let kServiceIdentifier   = "serviceIdentifier"
            static let kClientName          = "clientName"
            static let kDebt                = "debt"
            static let kNotification        = "notification"
            
        }
        
        struct URLs {
            
            #if PRODUCTION
            static let BASE_URL                = "https://test2.alignetsac.com"
            #elseif DEVELOPMENT
            static let BASE_URL                = "https://test2-alignetsac-com-yzsfvdohqwc1.runscope.net"
            #endif
            
            struct EndPoints {
                
                static let AGREGAR_SERVICIO             = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/addService"
                static let CONSULTAR_PAGOS              = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/txConsult"
                static let CONSULTAR_AGENDA             = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/calendarConsult"
                static let CONSULTAR_DEUDAS             = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/debtConsult"
                static let CONSULTAR_NOTIFICACIONES     = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/notificationConsult"
                static let CONSULTAR_SERVICIOS          = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/getServices"
                static let ELIMINAR_NOTIFICACION        = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/deleteNotification"
                static let PAGAR_SERVICIO               = "\(URLs.BASE_URL)/WALLETWS/rest/mobile/pay"
            }
        }
    }
    
    struct Storyboard {
        
        static let kMessages = "Messages"
        static let kNotify   = "Notify"
        static let kHome     = "Home"
        static let kConfig   = "ServiceConfiguration"
        
        struct Segues {
            
            static let kToEmpresas              = "kToEmpresas"
            static let kToValidacionServicio    = "kToValidacionServicio"
            static let kDetailSuministro        = "kToDetailSuministro"
        }
    }
    
    struct ViewController {
        
        static let kMessages                    = "kMessages"
        static let kNotificacionesHome          = "kNotificacionesHome"
        static let kNotificaciones              = "kNotificaciones"
        static let kServicioGuardado            = "kServicioGuardado"
        static let kPagoExitoso                 = "kPagoExitoso"
        static let kPagoNoAutorizadoA           = "kPagoNoAutorizadoA"
        static let kPagoNoAutorizadoB           = "kPagoNoAutorizadoB"
        static let kTarjetaCreditoNoValidaA     = "kTarjetaCreditoNoValidaA"
        static let kAdicionarTarjeta            = "kAdicionarTarjeta"
        static let kSettings                    = "kSettings"
    }
}
