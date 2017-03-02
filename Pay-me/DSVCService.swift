//
//  DSVCService.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 1/03/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension DetalleSuministroViewController: DetalleSuministroViewControllerServicesDelegate {
    
    internal func callAddServices() {
        
        if let response = self.apiResponse {
            let request = RequestAgregarServicio(services: )
        }
    }
}

extension DetalleSuministroViewController: AgregarServicioDelegate {
    
    internal func serviceSuccess(response: ResponseAgregarServicio) {
        self.toSegue(identifier: "")
    }
    
    internal func serviceFailed(error: PaymeError) {
        print("\(error.answerCode)\t\(error.answerMessage)")
    }
}

protocol DetalleSuministroViewControllerServicesDelegate {
    
    func callAddServices()
}
