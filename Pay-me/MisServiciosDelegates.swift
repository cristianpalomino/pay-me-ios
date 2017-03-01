//
//  MisServiciosDelegates.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 28/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

protocol MisServiciosServiceDelegate {
    
    func serviceFailed(error :PaymeError)
}

protocol AgregarServicioDelegate : MisServiciosServiceDelegate {
    
    func serviceSuccess(response :ResponseAgregarServicio)
}

protocol ConsultarDeudasDelegate : MisServiciosServiceDelegate {
    
    func serviceSuccess(response :ResponseConsultarDeudas)
}

protocol ConsultarServiciosDelegate : MisServiciosServiceDelegate {
    
    func serviceSuccess(response :ResponseConsultarServicios)
}
