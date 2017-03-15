//
//  ServiciosServices.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 28/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class ServiciosServices {
    
    var agregarServicioDelegate     :AgregarServicioDelegate?
    var consultarDeudasDelegate     :ConsultarDeudasDelegate?
    var consultarServiciosDelegate  :ConsultarServiciosDelegate?
    
    func serviceAgregarServicio(request :RequestAgregarServicio) {
        ServiciosApi.apiAgregarServicio(request: request, completion: {
            api in
            switch api.result {
            case .success:
                let response = api.data as! ResponseAgregarServicio
                self.agregarServicioDelegate?.serviceSuccess(response: response)
                
            case .failure:
                self.agregarServicioDelegate?.serviceFailed(error: api.error!)
            }
        })
    }
    
    func serviceConsultarDeudas(request :RequestConsultarDeudas) {
        ServiciosApi.apiConsultarDeudas(request: request, completion: {
            api in
            switch api.result {
            case .success:
                let response = api.data as! ResponseConsultarDeudas
                self.consultarDeudasDelegate?.serviceSuccess(response: response)

            case .failure:
                self.consultarDeudasDelegate?.serviceFailed(error: api.error!)
            }
        })
    }
    
    func apiConsultarServicios(request :RequestConsultarServicios) {
        ServiciosApi.apiConsultarServicios(request: request, completion: {
            api in
            switch api.result {
            case .success:
                let response = api.data as! ResponseConsultarServicios
                self.consultarServiciosDelegate?.serviceSuccess(response: response)
            case .failure:
                self.consultarServiciosDelegate?.serviceFailed(error: api.error!)
            }
        })
    }
}


