//
//  FVCServices.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation


extension FavoritosViewController: FavoritosViewControllerServicesDelegate {
    
    func callGetServices() {
        let request = RequestConsultarServicios()
        PaymeServices.sharedInstance.serviciosServices.apiConsultarServicios(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarServiciosDelegate = self
    }
}

extension FavoritosViewController: ConsultarServiciosDelegate {
    
    func serviceSuccess(response: ResponseConsultarServicios) {
        self.serviciosFavoritos = response.services
    }
    
    func serviceFailed(error: PaymeError) {
        print("\(error.answerCode)\t\(error.answerMessage)")
    }
}

protocol FavoritosViewControllerServicesDelegate {
    
    func callGetServices()
}
