//
//  FVCServices.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation


extension FavoritosViewController: FavoritosViewControllerServicesDelegate {
    
    internal func callServiceConsultarRecibos(withService service:Service) {
        
        let request = RequestConsultarDeudas(idCompany: service.idCompanySPS, idService: service.idServiceSPS, serviceIdentifier: service.codeService)
        
        PaymeServices.sharedInstance.serviciosServices.serviceConsultarDeudas(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarDeudasDelegate = self
        
        showHUD()
    }
    
    internal func callServiceFavoritos() {
        
        let request = RequestConsultarServicios()
        PaymeServices.sharedInstance.serviciosServices.apiConsultarServicios(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarServiciosDelegate = self
    }
}

extension FavoritosViewController: ConsultarServiciosDelegate {
    
    func serviceSuccess(response: ResponseConsultarServicios) {
        self.serviciosFavoritos = response.services
    }
}

extension FavoritosViewController: ConsultarDeudasDelegate {
    
    func serviceSuccess(response: ResponseConsultarDeudas) {
        self.toSegue(identifier: Constants.Storyboard.Segues.kRecibo)
    }
}

extension FavoritosViewController {
    
    func serviceFailed(error: PaymeError) {
        print("\(error.answerCode)\t\(error.answerMessage)")
    }
}

protocol FavoritosViewControllerServicesDelegate {
    
    func callServiceFavoritos()
    func callServiceConsultarRecibos(withService service:Service)
}
