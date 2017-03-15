//
//  DSVCService.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 1/03/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation
import SwiftyJSON

extension DetalleSuministroViewController: DetalleSuministroViewControllerServicesDelegate {
    
    internal func callAddServices() {

        if let response = self.apiResponse,
            let item = Session.sharedInstance.current.item,
            let identifier = self.serviceIdentifier {
            
            let serviceAtributtes = [Service.Keys.kIdCompanySPS     : item.idCompany,
                                     Service.Keys.kIdServiceSPS     : item.idService,
                                     Service.Keys.kServiceIdentifier: identifier,
                                     Service.Keys.kOwner            : response.clientName]
            let service = Service(json: JSON(serviceAtributtes))
            let request = RequestAgregarServicio(services: [service])
            
            PaymeServices.sharedInstance.serviciosServices.serviceAgregarServicio(request: request)
            PaymeServices.sharedInstance.serviciosServices.agregarServicioDelegate = self
        }
    }
}

extension DetalleSuministroViewController: AgregarServicioDelegate {
    
    internal func serviceSuccess(response: ResponseAgregarServicio) {
        showMessage(type: .SERVICE_SAVED)
    }
    
    internal func serviceFailed(error: PaymeError) {
        print("\(error.answerCode)\t\(error.answerMessage)")
    }
}

protocol DetalleSuministroViewControllerServicesDelegate {
    
    func callAddServices()
}
