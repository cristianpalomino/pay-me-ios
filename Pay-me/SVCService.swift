//
//  SVCServices.swift
//  Pay-me
//
//  Created by Cristian Palomino Rivera on 27/02/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

extension SuministroViewController: ConsultarDeudasDelegate {
    
    func serviceSuccess(response: ResponseConsultarDeudas) {
        self.apiResponse = response
        self.toSegue(identifier: Constants.Storyboard.Segues.kDetailSuministro)
    }
    
    func serviceFailed(error: PaymeError) {
        print(error.answerCode)
        showErrorView(pmError: error)
    }
}

extension SuministroViewController: SuministroViewControllerServicesDelegate {
    
    func callGetServices() {
        guard txtIndentifier.text?.trimmed != "" else {
            print("Add Identifier")
            return
        }
        
        txtIndentifier.resignFirstResponder()
        
        let identifier  = txtIndentifier.text!
        let current     = Session.sharedInstance.current
        let idCompany   = current.item!.empresa.idCompany!
        let idService   = current.item!.idService!
        
        let request = RequestConsultarDeudas(idCompany: idCompany, idService: idService, serviceIdentifier: identifier)
        
        PaymeServices.sharedInstance.serviciosServices.serviceConsultarDeudas(request: request)
        PaymeServices.sharedInstance.serviciosServices.consultarDeudasDelegate = self
        
        showHUD()
    }
}

protocol SuministroViewControllerServicesDelegate {
    
    func callGetServices()
}
