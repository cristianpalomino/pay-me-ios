//
//  ServiciosServices.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 28/01/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class ServiciosServices {
    
    var consultarDeudasDelegate :ConsultarDeudasDelegate?
    
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
}


