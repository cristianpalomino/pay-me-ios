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
        if let codeService = service.serviceIdentifier {
            let request = RequestConsultarDeudas(idCompany: service.idCompanySPS,
                                                 idService: service.idServiceSPS,
                                                 serviceIdentifier: codeService)
            PaymeServices.sharedInstance.serviciosServices.serviceConsultarDeudas(request: request)
            PaymeServices.sharedInstance.serviciosServices.consultarDeudasDelegate = self
            
            showHUD()
        }
    }
    
    internal func callServiceFavoritos() {
        
        let request = RequestConsultarServicios()
        
        PaymeServices.sharedInstance.serviciosServices.apiConsultarServicios(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarServiciosDelegate = self
    }
}

extension FavoritosViewController: ConsultarServiciosDelegate {
    
    func serviceSuccess(response: ResponseConsultarServicios) {
        Session.sharedInstance.serviciosFavoritos = response.services
        
        let source = Session.sharedInstance.serviciosFavoritos
        let local  = self.serviciosFavoritos
        
        let setSource = Set(source)
        let newServices = Array(setSource.subtracting(self.serviciosFavoritos))
        
        if !newServices.isEmpty {
            
            self.serviciosFavoritos.append(contentsOf: newServices)
            var indexPaths = [IndexPath]()
            
            for i in 0...(newServices.count - 1) {
                indexPaths.append(IndexPath(row: local.count + i , section: 0))
            }
            
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: indexPaths, with: .automatic)
            self.tableView.endUpdates()
        }
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
